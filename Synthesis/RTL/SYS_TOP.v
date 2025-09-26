module SYS_TOP #(parameter DATA_WIDTH = 8, REG_FILE_DEPTH = 16)
(
    input  wire   RST_N         ,
    input  wire   REF_CLK       ,
    input  wire   UART_CLK      ,
    input  wire   UART_RX_IN    ,
    output wire   UART_TX_O     ,
    output wire   parity_error  ,
    output wire   framing_error
);

//=====================================================================//
//                         Local Parameters                            //
//=====================================================================//
localparam RF_ADDR = $clog2(REG_FILE_DEPTH ) ;

//=====================================================================//
//                              Wires                                  //
//=====================================================================//

wire                                   SYNC_UART_RST;
wire                                   SYNC_REF_RST;

wire                                   UART_TX_CLK;
wire                                   UART_RX_CLK;

wire      [DATA_WIDTH-1:0]             Operand_A;
wire      [DATA_WIDTH-1:0]             Operand_B;
wire      [DATA_WIDTH-1:0]             UART_Config;
wire      [DATA_WIDTH-1:0]             DIV_RATIO;

wire      [3:0]                        DIV_RATIO_RX;

wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire                                   UART_RX_V_OUT;
wire      [DATA_WIDTH-1:0]             UART_RX_SYNC;
wire                                   UART_RX_V_SYNC;

wire      [DATA_WIDTH-1:0]             UART_TX_IN;
wire                                   UART_TX_VLD;
wire      [DATA_WIDTH-1:0]             UART_TX_SYNC;
wire                                   UART_TX_V_SYNC;

wire                                   UART_TX_Busy;	
wire                                   UART_TX_Busy_PULSE;	

wire                                   RF_WrEn;
wire                                   RF_RdEn;
wire      [RF_ADDR-1:0]                RF_Address;
wire      [DATA_WIDTH-1:0]             RF_WrData;
wire      [DATA_WIDTH-1:0]             RF_RdData;
wire                                   RF_RdData_VLD;									   

wire                                   CLKG_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN; 
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_VLD; 

wire                                   ALU_CLK;								   
wire                                   FIFO_FULL;
wire                                   CLKDIV_EN;

//=====================================================================//
//                        Reset Synchronizers                          //
//=====================================================================//

RST_SYNC #(.NUM_STAGES(2)) U0_RST_SYNC 
(
    .RST      (RST_N),
    .CLK      (UART_CLK),
    .SYNC_RST (SYNC_UART_RST)
);

RST_SYNC #(.NUM_STAGES(2)) U1_RST_SYNC 
(
    .RST      (RST_N),
    .CLK      (REF_CLK),
    .SYNC_RST (SYNC_REF_RST)
);

//=====================================================================//
//                         Data Synchronizer                           //
//=====================================================================//

DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(8)) U0_ref_Data_sync 
(
    .CLK          (REF_CLK),
    .RST          (SYNC_REF_RST),
    .unsync_bus   (UART_RX_OUT),
    .BUS_EN       (UART_RX_V_OUT),
    .sync_bus     (UART_RX_SYNC),
    .enable_pulse (UART_RX_V_SYNC)

);

//=====================================================================//
//                           Async FIFO                                //
//=====================================================================//
ASYNC_FIFO_TOP #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(8)) U0_ASYNC_FIFO
(
    .W_CLK   (REF_CLK)            , 
    .W_RST   (SYNC_REF_RST)       , 
    .W_INC   (UART_TX_VLD)        , 
    .R_CLK   (UART_TX_CLK)        , 
    .R_RST   (SYNC_UART_RST)      , 
    .R_INC   (UART_TX_Busy_PULSE) , 
    .WR_DATA (UART_TX_IN)         , 
    .RD_DATA (UART_TX_SYNC)       , 
    .FULL    (FIFO_FULL)          , 
    .EMPTY   (UART_TX_V_SYNC)   
);

//=====================================================================//
//                         Pulse Generator                             //
//=====================================================================//

PULSE_GEN U0_PULSE_GEN
(
    .CLK       (UART_TX_CLK)        , 
    .RST       (SYNC_UART_RST)      , 
    .LVL_SIG   (UART_TX_Busy)       , 
    .PULSE_SIG (UART_TX_Busy_PULSE)   
);

//=====================================================================//
//                  Clock Divider for UART_TX Clock                    //
//=====================================================================//

Clk_Divider U0_ClkDiv
(
    .i_ref_clk   (UART_CLK)      ,  
    .i_rst_n     (SYNC_UART_RST) ,  
    .i_clk_en    (CLKDIV_EN)     ,  
    .i_div_ratio (DIV_RATIO)     ,  
    .o_div_clk   (UART_TX_CLK)    
);

//=====================================================================//
//                        Custom Mux Clock                             //
//=====================================================================//

CLKDIV_MUX U0_CLKDIV_MUX
(
    .IN  (UART_Config[7:2]) ,
    .OUT (DIV_RATIO_RX)  
);

//=====================================================================//
//                  Clock Divider for UART_RX Clock                    //
//=====================================================================//

Clk_Divider U1_ClkDiv
(
    .i_ref_clk   (UART_CLK)      ,  
    .i_rst_n     (SYNC_UART_RST) ,  
    .i_clk_en    (CLKDIV_EN)     ,  
    .i_div_ratio ({4'h0, DIV_RATIO_RX})  ,  
    .o_div_clk   (UART_RX_CLK)    
);


//=====================================================================//
//                               UART                                  //
//=====================================================================//

UART_TOP U0_UART
(
    .RST           (SYNC_UART_RST)    , 
    .TX_CLK        (UART_TX_CLK)      , 
    .RX_CLK        (UART_RX_CLK)      , 
    .PAR_EN        (UART_Config[0])   , 
    .PAR_TYP       (UART_Config[1])   , 
    .Prescale      (UART_Config[7:2]) , 
    .TX_IN_P       (UART_TX_SYNC)     , 
    .TX_IN_V       (!UART_TX_V_SYNC)  , 
    .RX_IN_S       (UART_RX_IN)       , 
    .TX_OUT_S      (UART_TX_O)        , 
    .TX_OUT_V      (UART_TX_Busy)     , 
    .RX_OUT_P      (UART_RX_OUT)      , 
    .RX_OUT_V      (UART_RX_V_OUT)    , 
    .parity_error  (parity_error)     , 
    .stop_error    (framing_error)   
);

//=====================================================================//
//                        System Controller                            //
//=====================================================================//
SYS_CTRL U0_SYS_CTRL
(
    .CLK           (REF_CLK) , 
    .RST           (SYNC_REF_RST) , 
    .ALU_Valid     (ALU_OUT_VLD) , 
    .Rd_Data_Valid (RF_RdData_VLD) , 
    .RX_ENABLE     (UART_RX_V_SYNC) , 
    .RX_P_DATA     (UART_RX_SYNC) , 
    .FIFO_FULL     (FIFO_FULL) , 
    .Rd_Data       (RF_RdData) , 
    .ALU_OUT       (ALU_OUT) , 
    .Wr_En         (RF_WrEn) , 
    .Rd_En         (RF_RdEn) , 
    .ALU_EN        (ALU_EN) , 
    .CLK_EN        (CLKG_EN) , 
    .TX_D_VLD      (UART_TX_VLD) , 
    .clk_div_en    (CLKDIV_EN) , 
    .ALU_FUN       (ALU_FUN) , 
    .Address       (RF_Address) , 
    .Wr_Data       (RF_WrData) , 
    .TX_P_DATA     (UART_TX_IN)   
);


//=====================================================================//
//                          Register File                              //
//=====================================================================//
RegFile #(.DEPTH(REG_FILE_DEPTH), .WIDTH(DATA_WIDTH)) U0_RegFile
(
    .CLK     (REF_CLK) , 
    .RST     (SYNC_REF_RST) , 
    .WrEn    (RF_WrEn) , 
    .RdEn    (RF_RdEn) , 
    .Address (RF_Address) , 
    .WrData  (RF_WrData) , 
    .RdData  (RF_RdData) , 
    .RdValid (RF_RdData_VLD) , 
    .REG0    (Operand_A) , 
    .REG1    (Operand_B) , 
    .REG2    (UART_Config) , 
    .REG3    (DIV_RATIO)   
);


//=====================================================================//
//                               ALU                                   //
//=====================================================================//

ALU #(.WIDTH(DATA_WIDTH)) U0_ALU
(
    .CLK       (ALU_CLK) , 
    .RST       (SYNC_REF_RST) , 
    .EN        (ALU_EN) , 
    .A         (Operand_A) , 
    .B         (Operand_B) , 
    .ALU_FUN   (ALU_FUN) , 
    .ALU_OUT   (ALU_OUT) , 
    .OUT_VALID (ALU_OUT_VLD)   
);
 
//=====================================================================//
//                           Clock Gating                              //
//=====================================================================//
CLK_GATE U0_CLK_GATE
(
    .CLK       (REF_CLK) ,
    .CLK_EN    (CLKG_EN) ,
    .GATED_CLK (ALU_CLK) 
);

endmodule