module CLKDIV_MUX 
(
    input  wire [5:0] IN  ,  // Control input
    output reg  [3:0] OUT    // Division factor output
);

always @(*) 
begin
    case (IN) 
        6'd32   : OUT = 4'd1 ;   // Select divide by 1
        6'd16   : OUT = 4'd2 ;   // Select divide by 2
        6'd8    : OUT = 4'd4 ;   // Select divide by 4
        6'd4    : OUT = 4'd8 ;   // Select divide by 8
        default : OUT = 4'd1 ;   // Default case: RX_CLK = TX_CLK * 32
    endcase
end
endmodule