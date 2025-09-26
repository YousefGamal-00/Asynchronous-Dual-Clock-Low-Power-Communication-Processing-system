module PULSE_GEN 
(
    input  wire CLK       , // Clock signal
    input  wire RST       , // Active-low reset
    input  wire LVL_SIG   , // Level signal (input to be converted to pulse)
    output wire PULSE_SIG   // Generated pulse signal (1 cycle when LVL_SIG rises)
);

    // Registers to hold current and previous value of LVL_SIG
    reg reg_SIG_0, reg_SIG_1; 

    // Sequential logic: capture LVL_SIG on rising edge of CLK
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
        begin        
            reg_SIG_0 <= 1'b0;   // Reset register storing current LVL_SIG
            reg_SIG_1 <= 1'b0;   // Reset register storing previous LVL_SIG
        end
        else     
        begin
            reg_SIG_0 <= LVL_SIG;   // Store current input
            reg_SIG_1 <= reg_SIG_0; // Store previous input
        end
    end

    // Pulse generation logic: 
    // Assert PULSE_SIG for one cycle when LVL_SIG transitions from 0 -> 1
    assign PULSE_SIG = reg_SIG_0 && (!reg_SIG_1);

endmodule
