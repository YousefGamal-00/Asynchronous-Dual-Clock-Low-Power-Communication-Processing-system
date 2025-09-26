module UART_RX_stop_check 
(
    input wire clk          , // system clock
    input wire rst_n        , // active-low reset
    input wire enable       , // enable signal to allow stop error detection
    input wire serial_data  , // incoming UART serial data
    output reg stop_error     // output flag indicating a stop bit error
);
    
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n)
            begin
                stop_error <= 1'b0 ; // reset stop_error to 0 when reset is asserted
            end    
        else if (enable && !serial_data) 
            begin
                stop_error <= 1'b1 ; // set stop_error when enabled and serial data is low (stop bit missing)
            end    

    end
endmodule
