module UART_RX_Top 
(
    input  wire        CLK,          // UART RX Clock Signal
    input  wire        RST,          // Synchronized reset signal
    input  wire        PAR_TYP,      // Parity Type
    input  wire        PAR_EN,       // Parity Enable
    input  wire [5:0]  Prescale,     // Oversampling Prescale
    input  wire        RX_IN,        // Serial Data IN
    output wire [7:0]  P_DATA,       // Frame Data Byte
    output wire        Data_valid,   // Data Byte Valid signal
    output wire        Parity_Error, // Frame Parity Error
    output wire        Stop_Error    // Frame Stop Error
);
    
wire enable_des, enable_edge, enable_par, samp_en, enable_str, enable_stp ;
wire serial_bit, Parity_Err, Start_Err, Stop_Err ;
wire [4:0] edge_count ;
wire [3:0] bit_count  ;

UART_RX_deserializer  U_desrial
(
    .clk(CLK)                ,
    .rst_n(RST)              ,  
    .P_DATA(P_DATA)          ,     
    .enable(enable_des)      ,     
    .serial_data(serial_bit) 
);

UART_RX_edge_counter U_edge_counter
(
    .clk(CLK)             ,
    .rst_n(RST)           ,
    .PAR_EN(PAR_EN)       ,
    .bit_cnt(bit_count)   , 
    .Prescale(Prescale)   , 
    .enable(enable_edge)  ,    
    .edge_cnt(edge_count) 
);

UART_RX_sampler U_sampler
(
    .clk(CLK)                ,  
    .rst_n(RST)              ,  
    .RX_IN(RX_IN)            ,    
    .sample_en(samp_en)      ,   
    .Prescale(Prescale)      ,    
    .edge_count(edge_count)  ,  
    .sampled_bit(serial_bit) 
);


UART_RX_parity_check U_Par_check
(
    .clk(CLK)                 ,
    .rst_n(RST)               ,
    .P_DATA(P_DATA)           , 
    .PAR_TYP(PAR_TYP)         ,  
    .enable(enable_par)       ,     
    .serial_data(serial_bit)  ,     
    .parity_error(Parity_Err)    
);


UART_RX_start_check U_start_chk
(
    .clk(CLK)                ,     
    .rst_n(RST)              ,
    .enable(enable_str)      ,      
    .serial_data(serial_bit) ,  
    .start_glitch(Start_Err) 
);

UART_RX_stop_check U_stop_chk
(
    .clk(CLK)                , 
    .rst_n(RST)              , 
    .enable(enable_stp)      , 
    .stop_error(Stop_Err)    ,
    .serial_data(serial_bit)   
);


UART_RX_FSM U_FSM
(
    .clk(CLK)                    , 
    .rst_n(RST)                  , 
    .RX_IN(RX_IN)                ,
    .PAR_EN(PAR_EN)              , 
    .Prescale(Prescale)          , 
    .bit_cnt(bit_count)          , 
    .par_err(Parity_Err)         , 
    .stp_err(Stop_Err)           , 
    .dat_samp_en(samp_en)        , 
    .edge_cnt(edge_count)        ,
    .edge_en(enable_edge)        , 
    .deser_en(enable_des)        ,
    .stop_error(Stop_Error)      ,
    .stp_chk_en(enable_stp)      ,
    .par_chk_en(enable_par)      ,
    .data_valid(Data_valid)      , 
    .start_glitch(Start_Err)     ,
    .strt_chk_en(enable_str)     ,
    .parity_error(Parity_Error)   
);
endmodule