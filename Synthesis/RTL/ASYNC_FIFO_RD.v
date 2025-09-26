module ASYNC_FIFO_RD #(parameter B_WIDTH = 3)
(
    input wire                  R_CLK   , 
    input wire                  R_RST   ,
    input wire                  R_INC   ,
    input wire  [B_WIDTH   : 0] G_wptr  , // Gray pointer size = binary version + 1
    output reg  [B_WIDTH   : 0] G_rptr  , // Gray pointer size = binary version + 1
    output wire [B_WIDTH-1 : 0] R_addr  , // Binary address
    output wire                 R_EMPTY 
);
    // internal address which is greater by one bit than binary 
    reg  [B_WIDTH : 0] inter_addr  ; 
    wire [B_WIDTH : 0] COMB_G_rptr ; 

    // assign output to lowest bits of internal address 
    assign R_addr = inter_addr[B_WIDTH-1 : 0] ;

    // EMPTY condition: Read pointer equal to Write pointer
    assign R_EMPTY = ( G_wptr == COMB_G_rptr ) ;

    // Convert binary READ address to gray code for cross-domain synchronization
    assign COMB_G_rptr = inter_addr ^ (inter_addr >> 1) ;

    // READ address counter logic
    always @(posedge R_CLK or negedge R_RST)
    begin
        if(!R_RST)
            begin
                inter_addr <= 'd0 ;  // Reset address to 0
            end
        else if(R_INC && !R_EMPTY)  // Increment only if read enable and not empty
            begin
                inter_addr <= inter_addr + 1'b1 ;  // Increment address
            end
    end

    // Sequential Version of Gray pointer
    always @(posedge R_CLK or negedge R_RST)
    begin
        if(!R_RST)
            begin
                G_rptr <= 'd0 ;  
            end
        else  
            begin
                G_rptr <=  COMB_G_rptr ;  
            end
    end
endmodule