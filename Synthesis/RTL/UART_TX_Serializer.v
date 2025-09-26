module UART_Serializer 
(
    input  wire       clk      ,  // System clock
    input  wire       RST_n    ,  // Async Active-low reset
    input  wire [7:0] P_DATA   ,  // Parallel data input
    input  wire       ser_en   ,  // Serialization enable signal
    input  wire       Load     ,  // Load signal for registering the data
    output reg        ser_done ,  // Serialization done flag
    output reg        ser_data    // Serial output bit
);

reg [7:0] P_DATA_reg   ;  // Register to hold parallel data
reg [2:0] counter      ;  // 3-bit counter for bit indexing
wire      counter_max  ;  // Flag to indicate counter reached max (7)


// Data register loading and serial output logic
always @(posedge clk or negedge RST_n) 
begin
    if(!RST_n)
        begin
            P_DATA_reg <= 8'b0;     // Clear data register on reset
            ser_data   <= 1'b0;     // Clear serial output on reset
        end    
    else if (Load) 
        begin
            P_DATA_reg   <= P_DATA ;  // Load parallel data on enable
        end
    else if (ser_en)
        begin
            ser_data <= P_DATA_reg[counter];  // Output the bit indexed by counter
        end    
end

// Serialization done flag generation logic
always @(posedge clk or negedge RST_n) 
begin
    if(!RST_n)
        begin
            ser_done <= 1'b0;      // Clear done flag on reset or new enable
        end
    else if(counter_max)
        begin
            ser_done <= 1'b1;      // Set done flag when last bit is reached
        end 
    else            
        begin
            ser_done <= 1'b0;      // Reset done flag when counter is not max
        end 
end

// Counter logic for serialization
always @(posedge clk or negedge RST_n) 
begin
    if(!RST_n)
        begin
            counter <= 3'b0;           // Reset counter on reset or new enable
        end
    else if(ser_en && !counter_max)
        begin
            counter <= counter + 1'b1 ; // Increment counter until max is reached
        end
    else            
        begin
            counter <= 3'b0;           // Reset counter on reset or new enable
        end
end

assign counter_max = (counter == 3'b111) ; // Assert when counter reaches last bit
endmodule