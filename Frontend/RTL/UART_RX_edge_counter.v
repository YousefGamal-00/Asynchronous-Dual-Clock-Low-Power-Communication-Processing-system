module UART_RX_edge_counter 
(
    input wire       clk      , // System clock
    input wire       rst_n    , // Active-low reset
    input wire       enable   , // enable signal for counting edges
    input wire       PAR_EN   , // Parity enable
    input wire [5:0] Prescale , // Prescaler value to determine number of clock edges per bit
    output reg [4:0] edge_cnt , // Counter for edges within one bit period
    output reg [3:0] bit_cnt    // Counter for number of bits received
);
    
// Signal indicating edge_cnt has reached its maximum (Prescale-1)
wire max_edge; 
assign max_edge = (edge_cnt == (Prescale - 1'b1));


// Edge counter: counts clock edges when enable is high
always @(posedge clk or negedge rst_n) 
begin
    if(!rst_n)
        begin
            edge_cnt <= 5'd0 ; // Reset edge counter to 0
        end    
    else if (enable && !max_edge) // enable = 1 during the counter operation
        begin
            edge_cnt <= edge_cnt + 1'b1 ; // Increment edge counter
        end
    else
        begin
            edge_cnt <= 5'd0 ; // Reset edge counter when max_edge reached or enable is low
        end    
end

// Signal indicating bit_cnt has reached its maximum (9 bits)
wire max_bits; 
assign max_bits = (PAR_EN) ? (bit_cnt == 4'd10) : (bit_cnt == 4'd9) ;

// Bit counter: increments whenever edge counter reaches max_edge
always @(posedge clk or negedge rst_n) 
begin
    if(!rst_n)
        begin
            bit_cnt  <= 4'd0 ; // Reset bit counter
        end    
    else if( enable && max_edge && !max_bits)
        begin
            bit_cnt <= bit_cnt + 1'b1 ; // Increment bit counter at the end of a bit period
        end
    else if(max_bits || !enable) 
        begin
            bit_cnt  <= 4'd0 ; // Reset bit counter in case of reaching 9-bits
        end
end
endmodule