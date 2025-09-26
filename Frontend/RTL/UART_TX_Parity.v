module UART_Parity 
( 
    input  wire       clk        ,  // System Clock 
    input  wire       RST_n      ,  // Async Active low reset 
    input  wire [7:0] P_DATA     ,  // 8-bit parallel input data
    input  wire       LOAD       ,  // LOAD signal from FSM to avoid glitches on Valid signal 
    input  wire       Data_Valid ,  // Indicates when the input data is valid
    input  wire       PAR_TYP    ,  // Parity type: 1 for Odd, 0 for Even
    output reg        Par_bit       // Output parity bit
);

localparam O_Parity = 1'b1 ;  // Define constant for Odd Parity
localparam E_Parity = 1'b0 ;  // Define constant for Even Parity

always @(posedge clk or negedge RST_n) 
begin
    if(!RST_n)    
        begin
            Par_bit <= 1'b0 ;                 
        end    
    else if(LOAD && Data_Valid && (PAR_TYP == O_Parity))       // If data is valid and parity type is Odd
        begin
            Par_bit <= ~^(P_DATA);                 
        end    
    else if(LOAD && Data_Valid && (PAR_TYP == E_Parity))       // If data is valid and parity type is Even
        begin
            Par_bit <= ^(P_DATA);                  
        end  
    else 
        begin
            Par_bit <= Par_bit ; // store the parity                  
        end  
end
endmodule
