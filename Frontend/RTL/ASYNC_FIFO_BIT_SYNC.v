module ASYNC_FIFO_BIT_SYNC #(parameter B_WIDTH = 3 , STAGES= 2)
(
    input  wire              CLK   ,
    input  wire              RST   , 
    input  wire [B_WIDTH :0] ASYNC , // add extra bit as synchronizer used for Gray version or pointers  
    output wire [B_WIDTH :0] SYNC    // add extra bit as synchronizer used for Gray version or pointers 
);
    
reg [STAGES-1 :0] SYNC_reg [B_WIDTH :0];
integer j;

// Bit synchronizer registers for each bit of the asynchronous input
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            begin
                for (j =0 ; j<(B_WIDTH+1) ; j=j+1) 
                    begin
                        SYNC_reg[j] <= 'd0 ;
                    end
            end
        else 
            begin
                for (j =0 ; j<(B_WIDTH+1) ; j=j+1) 
                    begin
                        SYNC_reg[j] <= { SYNC_reg[j][STAGES-2:0]  , ASYNC[j]} ;
                    end
            end    
    end

// Generate block to assign synchronized outputs for each bit
    genvar i ;
    generate
        for (i = 0; i<(B_WIDTH+1) ; i=i+1) 
            begin
                assign SYNC[i] = SYNC_reg[i][STAGES-1] ;
            end
    endgenerate
endmodule
