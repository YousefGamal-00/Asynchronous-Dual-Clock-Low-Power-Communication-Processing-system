module ASYNC_FIFO_WR #(parameter B_WIDTH = 3)
(
    input wire                  W_CLK  , 
    input wire                  W_RST  ,
    input wire                  W_INC  ,
    input wire  [B_WIDTH   : 0] G_rptr , // Gray pointer size = binary version + 1
    output reg  [B_WIDTH   : 0] G_wptr , // Gray pointer size = binary version + 1
    output wire [B_WIDTH-1 : 0] W_addr , // Binary address 
    output wire                 W_FULL 
);
    // Internal wires for full condition calculation
    wire [1:0]          High_2_bits ;  // Extract the two MSBs of the gray read pointer
    wire [B_WIDTH-2 :0] lower_bits  ;  // Extract the lower bits of the gray read pointer
    reg  [B_WIDTH   :0] inter_addr  ;  // Internal address which is greater by one bit than binary 
    wire [B_WIDTH   :0] COMB_G_wptr ;  // Combinational version of Gray pointer  

    // Extract bits from gray read pointer for full detection
    assign High_2_bits = G_rptr[B_WIDTH : B_WIDTH-1] ;  // MSBs indicate wrap-around
    assign lower_bits  = G_rptr[B_WIDTH-2 :0]        ;  // Lower bits for comparison

    // Full condition: write pointer catches up to read pointer (accounting for gray code wrap)
    assign W_FULL = ( COMB_G_wptr == {~High_2_bits , lower_bits} ) ;

    // Convert binary write address to gray code for cross-domain synchronization
    assign COMB_G_wptr = inter_addr ^ (inter_addr >> 1) ;

    // Assign output to lowest bits or intenral address 
    assign W_addr = inter_addr[B_WIDTH-1 : 0] ;
     
    // Write address counter logic
    always @(posedge W_CLK or negedge W_RST)
    begin
        if(!W_RST)
            begin
                inter_addr <= 'd0 ;  // Reset write address to 0
            end
        else if(W_INC && !W_FULL)  // Increment only if write enable and not full
            begin
                inter_addr <= inter_addr + 1'b1 ;  // Increment write address
            end
    end
    
    // Sequential Version of Gray pointer 
    always @(posedge W_CLK or negedge W_RST)
    begin
        if(!W_RST)
            begin
                G_wptr <= 'd0 ;  
            end
        else 
            begin
                G_wptr <= COMB_G_wptr ; 
            end
    end

endmodule