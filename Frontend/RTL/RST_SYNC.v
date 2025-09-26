module RST_SYNC #(parameter NUM_STAGES = 2) 
(
    input  wire CLK,       // Clock signal for synchronization
    input  wire RST,       // Asynchronous reset input (active low)
    output wire SYNC_RST   // Synchronized reset output (active low) 
);

// Internal register for synchronization stages
reg [NUM_STAGES-1 : 0] RST_reg ; 

// Output the synchronized reset from the last stage
assign SYNC_RST = RST_reg[NUM_STAGES-1];

// Synchronous logic to handle reset synchronization
always @(posedge CLK or negedge RST) 
    begin
        if(!RST)  // Asynchronous reset active (low)
            begin
                RST_reg <= 'd0 ;  // Clear all stages to 0
            end
        else  // Normal operation
            begin
                RST_reg <= {RST_reg[NUM_STAGES-2 : 0], 1'b1} ;  // Shift in 1'b1 to propagate reset release
            end       
    end
endmodule