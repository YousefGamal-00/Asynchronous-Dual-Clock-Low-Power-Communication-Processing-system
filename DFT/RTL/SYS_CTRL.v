module SYS_CTRL 
(
    // Input Ports
    input  wire        CLK           , // System clock
    input  wire        RST           , // Active-low reset
    input  wire        ALU_Valid     , // Indicates ALU_OUT is valid
    input  wire        Rd_Data_Valid , // Indicates RdData is valid from Reg_file   
    input  wire        RX_ENABLE     , // Data sync Enable 
    input  wire        FIFO_FULL     , // FIFO full flag  
    input  wire [7:0]  Rd_Data       , // Data read from Reg_file
    input  wire [7:0]  RX_P_DATA     , // RX parallel data
    input  wire [15:0] ALU_OUT       , // ALU operation result

    // Output Ports
    output wire        clk_div_en    , // Enable signal for clock divider
    output reg         Wr_En         , // Write enable for memory/peripheral
    output reg         Rd_En         , // Read enable for memory/peripheral
    output reg         ALU_EN        , // ALU enable signal
    output reg         CLK_EN        , // Clock gate enable
    output reg         TX_D_VLD      , // TX parallel data valid (WR_INC)
    output reg [3:0]   ALU_FUN       , // ALU function select
    output reg [3:0]   Address       , // Address bus for Reg_file
    output reg [7:0]   Wr_Data       , // Data to be written in Reg_file
    output reg [7:0]   TX_P_DATA       // TX parallel data (written in FIFO)
);

    //===========================
    // Command Opcodes
    //===========================
    localparam Reg_file_W = 8'hAA ; // Write Reg_file command
    localparam Reg_file_R = 8'hBB ; // Read Reg_file command
    localparam ALU_OP     = 8'hCC ; // ALU operation command
    localparam ALU_NOP    = 8'hDD ; // ALU no-operation command

    //===========================
    // Gray Encoded FSM States
    //===========================
        localparam IDLE        = 4'b0000 ; // idle state
        localparam WR_CMD      = 4'b0001 ; // write command
        localparam WR_ADD      = 4'b0011 ; // write address
        localparam WR_DATA     = 4'b0010 ; // write data
        localparam RD_CMD      = 4'b0110 ; // read command
        localparam RD_ADD      = 4'b0111 ; // read address
        localparam RD_REG_FILE = 4'b0101 ; // read regfile
        localparam ALU_CMD_OP  = 4'b0100 ; // ALU operation command
        localparam ALU_CMD_NOP = 4'b1100 ; // ALU no operation
        localparam OP_A        = 4'b1101 ; // operand A
        localparam OP_B        = 4'b1111 ; // operand B
        localparam FUN         = 4'b1110 ; // ALU function
        localparam RD_ALU_low  = 4'b1010 ; // read low 8 bits of ALU result
        localparam RD_ALU_high = 4'b1011 ; // read high 8 bits of ALU result

    //===========================
    // Internal Signals
    //===========================
    
    reg [3:0] Current_State, Next_State ; // FSM state registers
    reg [7:0] RX_P_DATA_reg;              // 1-cycle delay for data/address alignment
    reg [3:0] W_add_reg ;                 // Temporary register for write address

    assign clk_div_en = 1'b1 ;          // Clock divider always enabled

    //===========================
    // State Register (Memory)
    //===========================
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            Current_State <= IDLE ;      // Reset -> idle
        else 
            Current_State <= Next_State; // Update FSM state
    end

    //===========================
    // Next-State Logic
    //===========================
    always @(*) 
    begin
        case (Current_State)
            // Idle -> wait for valid RX command
            IDLE: 
                begin
                    if     (RX_ENABLE && (RX_P_DATA == Reg_file_W))  Next_State = WR_CMD ; 
                    else if(RX_ENABLE && (RX_P_DATA == Reg_file_R))  Next_State = RD_CMD ; 
                    else if(RX_ENABLE && (RX_P_DATA == ALU_OP)    )  Next_State = ALU_CMD_OP ; 
                    else if(RX_ENABLE && (RX_P_DATA == ALU_NOP)   )  Next_State = ALU_CMD_NOP ; 
                    else                                             Next_State = IDLE ; 
                end

            // Write sequence
            WR_CMD     : Next_State = (RX_ENABLE)  ? WR_ADD  : WR_CMD; 
            WR_ADD     : Next_State = (RX_ENABLE)  ? WR_DATA : WR_ADD; 
            WR_DATA    : Next_State = IDLE;  

            // Read sequence
            RD_CMD     : Next_State = (RX_ENABLE)                   ? RD_ADD      : RD_CMD;  
            RD_ADD     : Next_State = (Rd_Data_Valid && !FIFO_FULL) ? RD_REG_FILE : RD_ADD ;  
            RD_REG_FILE: Next_State = IDLE;  

            // ALU operation
            ALU_CMD_OP : Next_State = (RX_ENABLE)                   ? OP_A        : ALU_CMD_OP; 
            OP_A       : Next_State = (RX_ENABLE)                   ? OP_B        : OP_A; 
            OP_B       : Next_State = (RX_ENABLE)                   ? FUN         : OP_B; 
            FUN        : Next_State = (ALU_Valid && !FIFO_FULL)     ? RD_ALU_low  : FUN ; 

            // ALU no-op
            ALU_CMD_NOP: Next_State = (RX_ENABLE)                   ? FUN         : ALU_CMD_NOP; 

            // ALU readback
            RD_ALU_low : Next_State = (ALU_Valid && !FIFO_FULL)     ? RD_ALU_high : RD_ALU_low ; 
            RD_ALU_high: Next_State = IDLE; 

            // Default -> reset to idle
            default    : Next_State = IDLE; 
        endcase    
    end

    //===========================
    // Output Logic
    //===========================
    always @(*) 
    begin
        // Default outputs (inactive)
        Wr_En      = 0 ;  
        Rd_En      = 0 ;   
        ALU_EN     = 0 ; 
        CLK_EN     = 0 ; 
        TX_D_VLD   = 0 ; 
        ALU_FUN    = 0 ;
        Address    = 0 ;
        Wr_Data    = 0 ;
        TX_P_DATA  = 0 ;

        case (Current_State)
            // Write data into Reg_file
            WR_DATA : 
                begin
                    Address = W_add_reg ;
                    Wr_Data = RX_P_DATA ;
                    Wr_En   = 1'b1 ;
                end    

            // Read address -> enable read
            RD_ADD : 
                begin
                    Address = RX_P_DATA ; 
                    Rd_En   = 1'b1 ;
                end                       

            // Read result from Reg_file -> send to TX
            RD_REG_FILE : 
                begin
                    TX_P_DATA = Rd_Data ; 
                    TX_D_VLD  = 1'b1 ; 
                end                       

                 
            // Enable ALU clock for preparation
            ALU_CMD_NOP : 
                begin
                    CLK_EN = 1'b1 ; 
                end                       

            // Capture operand A
            OP_A : 
                begin
                    Address = 4'd0 ;
                    Wr_Data = RX_P_DATA_reg ; 
                    Wr_En   = 1'b1 ; 
                end                       

            // Enable ALU clock for preparation
            // Capture operand B
            OP_B : 
                begin
                    CLK_EN  = 1'b1 ;
                    Address = 4'd1 ;
                    Wr_Data = RX_P_DATA_reg ; 
                    Wr_En   = 1'b1 ; 
                end                       

            // Apply ALU function
            FUN : 
                begin
                    CLK_EN  = 1'b1 ;
                    ALU_EN  = 1'b1 ;
                    ALU_FUN = RX_P_DATA[3:0] ; 
                end                       

            // Send ALU result (LSB first)
            RD_ALU_low : 
                begin
                    TX_P_DATA = ALU_OUT[7:0] ; 
                    TX_D_VLD  = 1'b1 ; 
                end                       

            // Send ALU result (MSB second)
            RD_ALU_high : 
                begin
                    TX_P_DATA = ALU_OUT[15:8] ; 
                    TX_D_VLD  = 1'b1 ; 
                end                       

            // Default -> keep outputs inactive
            default: 
                begin
                    Wr_En      = 0 ;  
                    Rd_En      = 0 ;   
                    ALU_EN     = 0 ; 
                    CLK_EN     = 0 ; 
                    TX_D_VLD   = 0 ; 
                    ALU_FUN    = 0 ;
                    Address    = 0 ;
                    Wr_Data    = 0 ;
                    TX_P_DATA  = 0 ;
                end
        endcase 
    end

    //===========================
    // Write Address Register
    //===========================
    always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                W_add_reg <= 4'b0;            // Reset -> clear
            end
        else if(Current_State == WR_ADD && Next_State == WR_ADD) // Sampling the address At the correct time  
            begin
                W_add_reg <= RX_P_DATA;       // Capture address from RX
            end
    end
    //===========================
    // RX data Register
    //===========================
    always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                RX_P_DATA_reg <= 8'b0;            // Reset 
            end
        else if(Current_State == OP_A || Current_State == OP_B) // Sampling the data At the correct time  
            begin
                RX_P_DATA_reg <= RX_P_DATA;       // Capture it 
            end
    end
endmodule