module ALU #(parameter WIDTH = 8)
(
    // Input Ports
    input wire               CLK       , // Clock Signal
    input wire               RST       , // Active Low Reset
    input wire               EN        , // Enable Signal
    input wire [3:0]         ALU_FUN   , // ALU Function Selector
    input wire [WIDTH-1:0]   A         , // Operand A
    input wire [WIDTH-1:0]   B         , // Operand B
    
    // Output Ports
    output reg [2*WIDTH-1:0] ALU_OUT   , // ALU Output Result
    output reg               OUT_VALID   // Output Valid Signal
);

/////////////////////////////////////////////////////////////////////
// OUT_VALID Control Logic
// - Reset clears OUT_VALID
// - Asserted when EN = 1
// - De-asserted when EN = 0
/////////////////////////////////////////////////////////////////////
always @(posedge CLK or negedge RST) 
begin
    if     (!RST)  OUT_VALID <= 1'b0 ;  
    else if(EN)    OUT_VALID <= 1'b1 ;
    else           OUT_VALID <= 1'b0 ;
end  

/////////////////////////////////////////////////////////////////////
// ALU Operation
// - Executed only when EN = 1
// - Otherwise ALU_OUT is forced to 0
/////////////////////////////////////////////////////////////////////
always @(posedge CLK or negedge RST) 
begin
    if(!RST)
        begin
            ALU_OUT <= 'd0 ;
        end
    else if (EN)
        begin
            case (ALU_FUN)
                4'b0000: ALU_OUT <= A + B ;                        // Addition
                4'b0001: ALU_OUT <= A - B ;                        // Subtraction
                4'b0010: ALU_OUT <= A * B ;                        // Multiplication
                4'b0011: ALU_OUT <= (B) ? A / B : {2*WIDTH{1'b1}}; // Division (check B!=0)
                4'b0100: ALU_OUT <= A & B ;                        // Bitwise AND
                4'b0101: ALU_OUT <= A | B ;                        // Bitwise OR
                4'b0110: ALU_OUT <= ~(A & B) ;                     // NAND
                4'b0111: ALU_OUT <= ~(A | B) ;                     // NOR
                4'b1000: ALU_OUT <= A ^ B ;                        // XOR
                4'b1001: ALU_OUT <= ~(A ^ B) ;                     // XNOR
                4'b1010: ALU_OUT <= (A == B) ? 'b1  : 'b0 ;        // Equality Check
                4'b1011: ALU_OUT <= (A >  B) ? 'b10 : 'b0 ;        // Greater Than
                4'b1100: ALU_OUT <= (A <  B) ? 'b11 : 'b0 ;        // Less Than
                4'b1101: ALU_OUT <= A >> 1 ;                       // Logical Right Shift
                4'b1110: ALU_OUT <= A << 1 ;                       // Logical Left Shift
                default: ALU_OUT <= 'd0 ;                          // Default Case
            endcase 
        end
    else 
        begin
            ALU_OUT <= 'd0 ; // Force output to 0 when disabled
        end    
end

endmodule
