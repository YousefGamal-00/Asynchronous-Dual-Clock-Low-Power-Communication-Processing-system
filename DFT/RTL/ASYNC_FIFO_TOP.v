module ASYNC_FIFO_TOP #(parameter DATA_WIDTH = 8 , DEPTH = 8)
(
    input  wire                   W_CLK   , // Write clock
    input  wire                   W_RST   , // Write reset
    input  wire                   W_INC   , // Write increment
    input  wire                   R_CLK   , // Read clock
    input  wire                   R_RST   , // Read reset
    input  wire                   R_INC   , // Read increment
    input  wire [DATA_WIDTH-1 :0] WR_DATA , // Write data input
    output wire [DATA_WIDTH-1 :0] RD_DATA , // Read data output
    output wire                   FULL    , // FIFO full flag
    output wire                   EMPTY     // FIFO empty flag
);

localparam Ptr_B_Width = $clog2(DEPTH) ; // Pointer bit width based on depth
localparam NUM_STAGES  = 2 ;             // Number of synchronization stages

wire [Ptr_B_Width-1 :0] W_ADDRESS , R_ADDRESS ; // Write and read addresses
wire [Ptr_B_Width   :0] A_G_w_ptr , A_G_R_ptr ; // Asynchronous gray-coded write and read pointers
wire [Ptr_B_Width   :0] S_G_w_ptr , S_G_R_ptr ; // Synchronized gray-coded write and read pointers

// FIFO Memory instantiation
ASYNC_FIFO_MEM #(.DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) U_FIFO_MEM
 (
    .W_FULL(FULL)      ,  
    .W_CLK (W_CLK)     ,  
    .W_RST (W_RST)     ,  
    .W_INC (W_INC)     ,  
    .w_data(WR_DATA)   ,  
    .r_data(RD_DATA)   ,   
    .w_addr(W_ADDRESS) ,  
    .r_addr(R_ADDRESS) 
 );


// Write-to-Read synchronizer instantiation
ASYNC_FIFO_BIT_SYNC #(.B_WIDTH(Ptr_B_Width) , .STAGES(NUM_STAGES)) U_W2R_SYNC
(
    .CLK  (R_CLK)     ,
    .RST  (R_RST)     , 
    .ASYNC(A_G_w_ptr) , 
    .SYNC (S_G_w_ptr)   
);
    
// Read-to-Write synchronizer instantiation
ASYNC_FIFO_BIT_SYNC #(.B_WIDTH(Ptr_B_Width) , .STAGES(NUM_STAGES)) U_R2W_SYNC
(
    .CLK  (W_CLK)     ,
    .RST  (W_RST)     , 
    .ASYNC(A_G_R_ptr) , 
    .SYNC (S_G_R_ptr)   
);


// Write controller instantiation
ASYNC_FIFO_WR #(.B_WIDTH(Ptr_B_Width)) U_FIFO_WR 
(
    .W_CLK (W_CLK)     , 
    .W_RST (W_RST)     ,
    .W_INC (W_INC)     ,
    .G_rptr(S_G_R_ptr) , 
    .G_wptr(A_G_w_ptr) , 
    .W_addr(W_ADDRESS) , 
    .W_FULL(FULL) 
);

// Read controller instantiation
ASYNC_FIFO_RD #(.B_WIDTH(Ptr_B_Width)) U_FIFO_RD
(
    .R_CLK  (R_CLK)     , 
    .R_RST  (R_RST)     ,
    .R_INC  (R_INC)     ,
    .G_wptr (S_G_w_ptr) , 
    .G_rptr (A_G_R_ptr) , 
    .R_addr (R_ADDRESS) , 
    .R_EMPTY(EMPTY)  
);

endmodule