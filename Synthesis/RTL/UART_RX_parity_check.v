module UART_RX_parity_check 
(
    input wire       clk          , // system clock
    input wire       rst_n        , // active-low reset
    input wire       PAR_TYP      , // parity type: 1 = ODD, 0 = EVEN
    input wire       enable       , // enable signal to allow parity checking
    input wire       serial_data  , // incoming UART serial data (parity bit)
    input wire [7:0] P_DATA       , // parallel data to check parity against
    output reg       parity_error   // output flag indicating parity error
);

    localparam ODD  = 1'b1 ; // ODD parity
    localparam EVEN = 1'b0 ; // EVEN parity

    // calculate expected parity bit based on P_DATA and PAR_TYP
    wire parity_bit ;
    assign parity_bit = (PAR_TYP == ODD) ? ~^P_DATA : ^P_DATA ;

    // sequential logic to check parity on rising edge of clk or reset
    always @(posedge clk or negedge rst_n) 
    begin
        if (!rst_n)
            begin
                parity_error <= 1'b0 ; // reset parity error
            end    
        else if (enable && (serial_data != parity_bit) ) 
            begin
                parity_error <= 1'b1 ; // set error if serial_data does not match expected parity
            end
    end

endmodule