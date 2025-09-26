module ASYNC_FIFO_MEM #(parameter DATA_WIDTH = 8 , DEPTH = 8)
 (
    // Inputs:
    input wire                       W_CLK  ,  // Write clock
    input wire                       W_RST  ,  // Write Reset
    input wire                       W_INC  ,  // Write increment signal
    input wire                       W_FULL ,  // Write full flag
    input wire  [$clog2(DEPTH)-1 :0] w_addr ,  // Write address
    input wire  [$clog2(DEPTH)-1 :0] r_addr ,  // Read address
    input wire  [DATA_WIDTH-1 :0]    w_data ,  // Write data input
    // Outputs:
    output wire [DATA_WIDTH-1 :0]    r_data   // Read data output
 );

// Loop Counter 
integer i ; 
// W_CLKEN: Write clock enable signal
wire W_CLKEN ; 
// FIFO_MEM: Memory array for storing FIFO data
reg [DATA_WIDTH-1 :0] FIFO_MEM [DEPTH-1 :0] ;

// Write clock enable assignment: Enable write if not full and increment is high
assign W_CLKEN = !W_FULL & W_INC   ;
// Read data assignment: Output data from memory at read address
assign r_data = FIFO_MEM[r_addr] ;

// Write operation: On positive edge of write clock, if enabled, write data to memory at write address
always @(posedge W_CLK or negedge W_RST) 
begin
    if(!W_RST)
        begin
           for (i=0 ; i<DEPTH ; i=i+1) 
            begin
                FIFO_MEM[i] <= 'd0 ;
            end 
        end
    else if(W_CLKEN)
        begin
            FIFO_MEM[w_addr] <= w_data ; 
        end    
end
endmodule