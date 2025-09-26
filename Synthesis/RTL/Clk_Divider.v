module Clk_Divider 
(
    input  wire       i_ref_clk   ,  // Reference input clock
    input  wire       i_rst_n     ,  // Active-low reset
    input  wire       i_clk_en    ,  // Clock enable signal
    input  wire [7:0] i_div_ratio ,  // Division ratio (N)
    output wire       o_div_clk      // Divided clock output
);

    // Internal signals
    reg  [7:0] counter;
    reg        div_clk;
    reg        CLK_FLAG; // Used instead of clock in some conditions to prevent issues in DFT
    wire [7:0] half_period, half_period_p1;
    wire       illegal_ratio, G_enable, ODD;

    // Combinational logic
    assign illegal_ratio  = (!i_div_ratio) || (i_div_ratio == 8'd1); // Illegal ratio: 0 or 1 not allowed
    assign G_enable       = i_clk_en && !illegal_ratio;              // Enable only if clk_en is high & ratio legal
    assign ODD            = i_div_ratio[0];                          // Indicator if ratio is odd
    assign half_period    = i_div_ratio >> 1'b1;                     // Half-period for even division
    assign half_period_p1 = half_period + 1'b1;                      // Half-period + 1 for odd division handling

    // Clock divider logic + counter
    always @(posedge i_ref_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n) 
            begin
                div_clk  <= 1'b0;   // Reset output clock
                CLK_FLAG <= 1'b0;   // Reset flag
                counter  <= 8'd0;   // Reset counter
            end 
        else if (G_enable && !ODD) 
            begin
                // Even division
                if (counter == half_period - 1'b1) 
                    begin
                        div_clk <= ~div_clk; // Toggle clock
                        counter <= 8'd0;     // Reset counter
                    end 
                else 
                    begin
                        counter <= counter + 1'b1; // Increment counter
                    end
            end 
        else if (G_enable && ODD) 
            begin
                // Odd division
                if ((counter == half_period - 1'b1) && CLK_FLAG) 
                    begin
                        div_clk  <= 1'b0;            
                        counter  <= 8'd0;
                        CLK_FLAG <= ~CLK_FLAG;            
                    end 
                else if ((counter == half_period_p1 - 1'b1) && !CLK_FLAG) 
                    begin
                        div_clk  <= 1'b1;           
                        counter  <= 8'd0;
                        CLK_FLAG <= ~CLK_FLAG;            
                    end 
                else 
                    begin
                        counter <= counter + 1'b1; // Increment counter
                    end
            end 
        else 
            begin
                counter <= 8'd0;
            end
    end

    // Output assignment 
    assign o_div_clk = (G_enable) ? div_clk : i_ref_clk;

endmodule