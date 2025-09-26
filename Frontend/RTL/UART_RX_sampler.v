module UART_RX_sampler 
(
    input  wire       clk         , // System clock
    input  wire       rst_n       , // Active-low reset
    input  wire       RX_IN       , // Incoming RX signal
    input  wire       sample_en   , // Sampling enable
    input  wire [5:0] Prescale    , // Baud rate Prescaler value
    input  wire [4:0] edge_count  , // Current edge count within bit period
    output reg        sampled_bit   // Final sampled bit after processing
);
    // Registers for storing 3 samples per bit and a small counter for indexing them
    reg [1:0] sampled_data ; 
    reg [1:0] counter      ;    

    // Individual "sample hit" flags for each Prescale option
    wire sample_ps8, sample_ps16 , 
         sample_ps32, sample_hit ;

    // Sampling condition for Prescale = 8 → valid at edges 2,3,4 not 3,4,5 (as the edge counter is sequential input so the block take the older value)
    assign sample_ps8  = (Prescale == 6'd8)  && ((edge_count == 5'd2) || (edge_count == 5'd3) || (edge_count == 5'd4))  ;

    // Sampling condition for Prescale = 16 → valid at edges 6, 7, 8 (as the edge counter is sequential input so the block take the older value)
    assign sample_ps16 = (Prescale == 6'd16) && ((edge_count == 5'd6) || (edge_count == 5'd7) || (edge_count == 5'd8))  ;

    // Sampling condition for Prescale = 32 → valid at edges 14, 15, 16
    assign sample_ps32 = (Prescale == 6'd32) && ((edge_count == 5'd14) || (edge_count == 5'd15) || (edge_count == 5'd16)) ;

    // Combined condition — true if any Prescale's sampling point is reached
    assign sample_hit = sample_ps8 || sample_ps16 || sample_ps32 ;

    // ----------------------------
    // Sample counter update logic
    // ----------------------------
    wire max_value ;
    assign max_value = (counter == 2'd2) ;
    always @(posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            counter <= 2'b00; // Reset counter

        else if (sample_en && sample_hit && !max_value) 
            counter <= counter + 1'b1; // Increment after each sample point
            
        else if (max_value)
            counter <= 2'b00; // Reset counter when sampling disabled
    end

    // ----------------------------
    // Sampling logic
    // ----------------------------
    always @(posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            begin
                sampled_bit  <= 1'b0;   // Clear output bit
                sampled_data <= 3'b000; // Clear sample buffer
            end 
        // Take 3 samples per bit and store them
        else if (sample_en && sample_hit) 
            begin
                if(counter != 2)
                    begin
                        sampled_data[counter] <= RX_IN; // Store current sample
                    end
                else // Decide final bit
                    begin    
                        sampled_bit <= majority_voting({sampled_data , RX_IN});
                    end 
            end
    end

    // ----------------------------
    // Majority voting function
    // ----------------------------
    // Returns the value (0 or 1) that appears in at least two out of three samples
    function automatic majority_voting (input reg [2:0] data);
        begin        
            majority_voting = (data[2] & data[1]) | (data[2] & data[0]) | (data[1] & data[0]); 
        end
    endfunction

endmodule