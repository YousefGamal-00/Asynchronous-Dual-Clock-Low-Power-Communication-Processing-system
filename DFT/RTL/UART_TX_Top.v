module UART_TX_Top 
(
    input  wire       clk        ,  // UART TX Clock Signal
    input  wire       RST        ,  // Synchronized reset signal
    input  wire       PAR_TYP    ,  // Parity Type
    input  wire       PAR_EN     ,  // Parity_Enable
    input  wire [7:0] P_DATA     ,  // Input data byte
    input  wire       Data_Valid ,  // Input data valid signal
    output wire       TX_OUT     ,  // Serial Data OUT
    output wire       busy          // High signal during transmission, otherwise low
);

// internal Signals
wire parity , serial_done , serial_data , serializer_en , load_data;

// Instantiation of parity calculator
UART_Parity parity_calc
(
    .clk(clk)               ,       
    .RST_n(RST)             ,  
    .P_DATA(P_DATA)         ,
    .LOAD(load_data)        ,
    .Par_bit(parity)        ,  
    .PAR_TYP(PAR_TYP)       ,
    .Data_Valid(Data_Valid)
);

// Instantiation of UART FSM 
UART_FSM FSM
(
    .clk(clk)                ,        
    .busy(busy)              ,          
    .RST_n(RST)              , 
    .TX_OUT(TX_OUT)          ,   
    .PAR_EN(PAR_EN)          ,    
    .par_bit(parity)         ,
    .Load(load_data)         ,
    .ser_done(serial_done)   ,
    .ser_data(serial_data)   ,
    .ser_en(serializer_en)   , 
    .Data_Valid(Data_Valid)
);

// Instantiation of UART_Serializer
UART_Serializer SER
(
    .clk(clk)               ,       
    .RST_n(RST)             ,  
    .P_DATA(P_DATA)         ,
    .Load(load_data)        ,
    .ser_en(serializer_en)  ,
    .ser_done(serial_done)  ,
    .ser_data(serial_data)    
);

endmodule