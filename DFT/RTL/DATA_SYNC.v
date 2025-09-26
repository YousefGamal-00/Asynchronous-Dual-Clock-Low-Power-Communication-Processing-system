// Module: DATA_SYNC
// Description: This module synchronizes an asynchronous bus signal to the clock domain
//              and generates an enable pulse when the bus is enabled. It uses a multi-stage
//              synchronizer for metastability resolution and a pulse generator for enable signaling.

module DATA_SYNC #(parameter NUM_STAGES = 2 , // Number of synchronization stages for metastability
                   parameter BUS_WIDTH = 8)   // Width of the bus to be synchronized
(
    input wire                   CLK          , // Clock signal
    input wire                   RST          , // Asynchronous reset (active low)
    input wire                   BUS_EN       , // Enable signal for bus synchronization
    input wire [BUS_WIDTH-1 : 0] unsync_bus   , // Asynchronous input bus
    output reg [BUS_WIDTH-1 : 0] sync_bus     , // Synchronized output bus
    output reg                   enable_pulse   // Pulse output when bus is enabled and synchronized
);

// Internal registers and wires
reg [NUM_STAGES-1 :0] en_reg ; // Shift register for synchronizing BUS_EN
wire sync_en, Pulse_en ;       // Wires for synchronized enable and pulse enable

// Instantiate PULSE_GEN module to generate pulse on enable
PULSE_GEN U_PULSE_GEN
(
    .CLK       (CLK) , 
    .RST       (RST) , 
    .LVL_SIG   (sync_en) , 
    .PULSE_SIG (Pulse_en)   
);


// Assigning the Sync_enable 
assign sync_en = en_reg[NUM_STAGES-1] ;

// Synchronize BUS_EN through multiple stages to avoid metastability
always @(posedge CLK or negedge RST) 
begin
    if(!RST)
        begin
            en_reg <= 'd0 ; // Reset all stages to 0
        end    
    else 
        begin
            en_reg <= {en_reg[NUM_STAGES-2 :0] , BUS_EN} ; // Shift in BUS_EN to the register
        end    
end

// Capture the unsynchronized bus data when pulse is enabled
always @(posedge CLK or negedge RST) 
begin
    if(!RST)
        begin
            sync_bus <= 'd0 ; // Reset sync_bus to 0
        end    
    else if(Pulse_en)
        begin
            sync_bus <= unsync_bus ; // Capture unsync_bus on pulse
        end    
    else 
        begin
            sync_bus <= sync_bus ; // Hold the current value
        end    
end


// Output the enable pulse
always @(posedge CLK or negedge RST) 
begin
    if(!RST)
        begin
            enable_pulse <= 1'b0 ; // Reset enable_pulse to 0
        end
    else 
        begin
            enable_pulse <= Pulse_en ; // Output the pulse enable signal
        end    
end
endmodule