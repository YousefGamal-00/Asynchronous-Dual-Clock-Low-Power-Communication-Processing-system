module UART_RX_start_check 
(
    input wire clk          , // system clock
    input wire rst_n        , // active-low reset
    input wire enable       , // enable signal to allow start glitch detection
    input wire serial_data  , // incoming UART serial data
    output reg start_glitch   // output flag indicating a start glitch
);
    
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n)
            begin
                start_glitch <= 1'b0 ; // reset start_glitch to 0 when reset is asserted
            end    
        else if (enable && serial_data) 
            begin
                start_glitch <= 1'b1 ; // set start_glitch when enabled and serial data is high
            end    
    end
endmodule
