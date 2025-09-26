module SYS_TOP #(parameter DATA_WIDTH = 8, REG_FILE_DEPTH = 16, NUM_OF_CHAINS = 3)
(
    // Scan ports (for DFT / scan chain testing)
    input  wire                     scan_clk     , // Scan clock used during test mode
    input  wire                     scan_rst     , // Scan reset signal
    input  wire                     test_mode    , // Enables test mode when high
    input  wire                     SE           , // Scan enable (controls shift/capture in scan chain)
    input  wire [NUM_OF_CHAINS-1:0] SI           , // Scan chain serial inputs
    output wire [NUM_OF_CHAINS-1:0] SO           , // Scan chain serial outputs

    // Functional ports (normal operation of the system)
    input  wire                     RST_N        , // Active-low system reset
    input  wire                     REF_CLK      , // Reference system clock
    input  wire                     UART_CLK     , // UART dedicated clock
    input  wire                     UART_RX_IN   , // UART receive line (RX)
    output wire                     UART_TX_O    , // UART transmit line (TX)
    output wire                     parity_error , // Indicates UART parity check failure
    output wire                     framing_error // Indicates UART framing error (wrong stop bit)

);
//=====================================================================//
//                         Local Parameters                            //
//=====================================================================//
localparam RF_ADDR = $clog2(REG_FILE_DEPTH ) ;

//=====================================================================//
//                              Wires                                  //
//=====================================================================//

wire                                   MUXED_REF_CLK ;
wire                                   MUXED_UART_CLK;
wire                                   MUXED_TX_CLK  ;
wire                                   MUXED_RX_CLK  ;
wire                                   MUXED_RST     ;
wire                                   MUXED_REF_RST     ;
wire                                   MUXED_UART_RST     ;

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
//            Muxing Clocks + RST for DFT insertion                    //
//=====================================================================//

// REF_CLK mux: switches between normal reference clock and scan clock
MUX_2X1 U0_REF_CLK_MUX
(
    .IN_0 (REF_CLK)      , 
    .IN_1 (scan_clk)     , 
    .SEL  (test_mode)    , 
    .OUT  (MUXED_REF_CLK) 
);

// UART_CLK mux: switches between functional UART clock and scan clock
MUX_2X1 U1_UART_CLK_MUX
(
    .IN_0 (UART_CLK)       , 
    .IN_1 (scan_clk)       , 
    .SEL  (test_mode)      , 
    .OUT  (MUXED_UART_CLK) 
);

// UART_TX_CLK mux: switches between divided UART TX clock and scan clock
MUX_2X1 U2_TX_CLK_MUX
(
    .IN_0 (UART_TX_CLK)    , 
    .IN_1 (scan_clk)       , 
    .SEL  (test_mode)      , 
    .OUT  (MUXED_TX_CLK) 
);

// UART_RX_CLK mux: switches between divided UART RX clock and scan clock
MUX_2X1 U3_RX_CLK_MUX
(
    .IN_0 (UART_RX_CLK)    , 
    .IN_1 (scan_clk)       , 
    .SEL  (test_mode)      , 
    .OUT  (MUXED_RX_CLK) 
);

// Reset mux: switches between functional reset and scan reset
MUX_2X1 U4_RST_MUX
(
    .IN_0 (RST_N)     , 
    .IN_1 (scan_rst)  , 
    .SEL  (test_mode) , 
    .OUT  (MUXED_RST) 
);  

// Reset mux: switches between functional reset and scan reset
MUX_2X1 U5_SYNC_RST_MUX_REF
(
    .IN_0 (SYNC_REF_RST)     , 
    .IN_1 (scan_rst)  , 
    .SEL  (test_mode) , 
    .OUT  (MUXED_REF_RST) 
);  

// Reset mux: switches between functional reset and scan reset
MUX_2X1 U6_SYNC_RST_MUX_UART
(
    .IN_0 (SYNC_UART_RST)     , 
    .IN_1 (scan_rst)          , 
    .SEL  (test_mode)         , 
    .OUT  (MUXED_UART_RST) 
);  

//=====================================================================//
//                        Reset Synchronizers                          //
//=====================================================================//

RST_SYNC #(.NUM_STAGES(2)) U0_RST_SYNC 
(
    .RST      (MUXED_RST)      ,
    .CLK      (MUXED_UART_CLK) ,
    .SYNC_RST (SYNC_UART_RST)
);

RST_SYNC #(.NUM_STAGES(2)) U1_RST_SYNC 
(
    .RST      (MUXED_RST),
    .CLK      (MUXED_REF_CLK),
    .SYNC_RST (SYNC_REF_RST)
);

//=====================================================================//
//                         Data Synchronizer                           //
//=====================================================================//

DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(8)) U0_ref_Data_sync 
(
    .CLK          (MUXED_REF_CLK),
    .RST          (MUXED_REF_RST),
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
    .W_CLK   (MUXED_REF_CLK)            , 
    .W_RST   (MUXED_REF_RST)       , 
    .W_INC   (UART_TX_VLD)        , 
    .R_CLK   (MUXED_TX_CLK)        , 
    .R_RST   (MUXED_UART_RST)      , 
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
    .CLK       (MUXED_TX_CLK)       , 
    .RST       (MUXED_UART_RST)      , 
    .LVL_SIG   (UART_TX_Busy)       , 
    .PULSE_SIG (UART_TX_Busy_PULSE)   
);

//=====================================================================//
//                  Clock Divider for UART_TX Clock                    //
//=====================================================================//

Clk_Divider U0_ClkDiv
(
    .i_ref_clk   (MUXED_UART_CLK) ,  
    .i_rst_n     (MUXED_UART_RST)  ,  
    .i_clk_en    (CLKDIV_EN)      ,  
    .i_div_ratio (DIV_RATIO)      ,  
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
    .i_ref_clk   (MUXED_UART_CLK)        ,  
    .i_rst_n     (MUXED_UART_RST)         ,  
    .i_clk_en    (CLKDIV_EN)             ,  
    .i_div_ratio ({4'h0, DIV_RATIO_RX})  ,  
    .o_div_clk   (UART_RX_CLK)    
);


//=====================================================================//
//                               UART                                  //
//=====================================================================//

UART_TOP U0_UART
(
    .RST           (MUXED_UART_RST)    , 
    .TX_CLK        (MUXED_TX_CLK)     , 
    .RX_CLK        (MUXED_RX_CLK)     , 
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
    .CLK           (MUXED_REF_CLK) , 
    .RST           (MUXED_REF_RST) , 
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
    .CLK     (MUXED_REF_CLK) , 
    .RST     (MUXED_REF_RST) , 
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
    .RST       (MUXED_REF_RST) , 
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
    .CLK       (MUXED_REF_CLK) ,
    .CLK_EN    (CLKG_EN)       ,
    .test_en   (test_mode)     ,
    .GATED_CLK (ALU_CLK) 
);

endmodule
