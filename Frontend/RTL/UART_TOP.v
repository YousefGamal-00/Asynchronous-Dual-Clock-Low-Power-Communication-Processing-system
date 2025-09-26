module UART_TOP 
(
    // Input Ports
    input  wire        TX_CLK    , // UART TX Clock Signal
    input  wire        RX_CLK    , // UART RX Clock Signal
    input  wire        RST       , // Synchronized reset signal
    input  wire        PAR_TYP   , // Parity Type
    input  wire        PAR_EN    , // Parity Enable
    input  wire [5:0]  Prescale  , // Oversampling Prescale
    input  wire [7:0]  TX_IN_P   , // Input TX data byte
    input  wire        TX_IN_V   , // Input TX data valid signal
    input  wire        RX_IN_S   , // Input RX UART frame
    
    // TX Output Ports
    output wire        TX_OUT_S  , // TX Frame Serial Out
    output wire        TX_OUT_V  , // TX Out Valid signal
    
    // RX Output Ports
    output wire [7:0]  RX_OUT_P      , // RX Out Data
    output wire        RX_OUT_V      , // RX Out Data Valid signal
    output wire        parity_error  , // Parity error detection flag
    output wire        stop_error      // Stop bit error flag
);



// ========================
// TX Submodule Instantiation
// ========================
UART_TX_Top TX_UNIT 
(
    .RST        (RST)      , // Reset input
    .clk        (TX_CLK)   , // TX clock
    .PAR_TYP    (PAR_TYP)  , // Parity type
    .PAR_EN     (PAR_EN)   , // Parity enable
    .P_DATA     (TX_IN_P)  , // Parallel input data
    .Data_Valid (TX_IN_V)  , // Data valid flag
    .TX_OUT     (TX_OUT_S) , // Serial output
    .busy       (TX_OUT_V)   // TX busy flag mapped to TX_OUT_V
);



// ========================
// RX Submodule Instantiation
// ========================
UART_RX_Top RX_UNIT
(
    .RST          (RST)          , // Reset input
    .CLK          (RX_CLK)       , // RX clock
    .PAR_TYP      (PAR_TYP)      , // Parity type
    .PAR_EN       (PAR_EN)       , // Parity enable
    .Prescale     (Prescale)     , // Oversampling prescale
    .RX_IN        (RX_IN_S)      , // Serial RX input
    .P_DATA       (RX_OUT_P)     , // Received parallel data
    .Data_valid   (RX_OUT_V)     , // RX data valid flag
    .Parity_Error (parity_error) , // RX parity error flag
    .Stop_Error   (stop_error)     // RX framing error flag
);

endmodule
