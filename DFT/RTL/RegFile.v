module RegFile #(parameter DEPTH = 16, WIDTH = 8)
(
    // Input Ports
    input  wire                      CLK      , // Clock Signal 
    input  wire                      RST      , // Active Low Reset
    input  wire [$clog2(DEPTH)-1:0]  Address  , // Address bus
    input  wire                      WrEn     , // Write Enable
    input  wire                      RdEn     , // Read Enable
    input  wire [WIDTH-1:0]          WrData   , // Write Data Bus

    // Output Ports
    output reg  [WIDTH-1:0]          RdData   , // Read Data Bus
    output reg                       RdValid  , // Read Data Valid

    // Register Outputs
    output wire [WIDTH-1:0]          REG0     , // Register at Address 0x0
    output wire [WIDTH-1:0]          REG1     , // Register at Address 0x1
    output wire [WIDTH-1:0]          REG2     , // Register at Address 0x2
    output wire [WIDTH-1:0]          REG3       // Register at Address 0x3
);

    // Internal Register File
    integer i;
    reg [WIDTH-1:0] REG_FILE [DEPTH-1:0];

    // Map internal registers to outputs
    assign REG0 = REG_FILE[0];
    assign REG1 = REG_FILE[1];
    assign REG2 = REG_FILE[2];
    assign REG3 = REG_FILE[3];

    // Register File Write/Read Logic
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
            begin
                RdData <= {WIDTH{1'b0}};         // Clear read data
                for (i = 0; i < DEPTH; i = i + 1) 
                begin
                    if      (i == 2) REG_FILE[i] <= 'b100000_0_1; // Default init value
                    else if (i == 3) REG_FILE[i] <= 'b0010_0000; // Default init value
                    else             REG_FILE[i] <= 'd0;          // Reset others
                end
            end
        else if (WrEn && !RdEn) 
            begin
                REG_FILE[Address] <= WrData;     // Write operation
            end
        else if (RdEn && !WrEn) 
            begin
                RdData <= REG_FILE[Address];     // Read operation
            end
    end

    // Read Valid Generation
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
            begin
                RdValid <= 1'b0;                 // Clear valid flag
            end 
        else if (RdEn && !WrEn)
            begin
                RdValid <= 1'b1;                 // Assert valid when reading
            end    
        else 
            begin
                RdValid <= 1'b0;                 // Otherwise deassert
            end    
    end

endmodule
