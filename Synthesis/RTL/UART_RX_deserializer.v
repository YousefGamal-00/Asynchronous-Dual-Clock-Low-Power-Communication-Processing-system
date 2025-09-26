module UART_RX_deserializer  
(
    input wire       clk         , // system clock
    input wire       rst_n       , // active-low reset
    input wire       enable      , // enable signal for deserialization
    input wire       serial_data , // incoming serial data
    output reg [7:0] P_DATA        // parallel data output
);

    reg [7:0] P_DATA_reg ; // temporary register to store incoming serial bits
    reg [3:0] counter ;    // counter to track bit position
    wire      counter_max ; 

    // flag indicating when counter reached maximum 
    assign counter_max = (counter == 4'd8) ;

    // latch the parallel data output when the counter reaches max
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n) 
            begin
                P_DATA <= 8'd0 ; // reset output
            end    
        else if (counter_max)
            begin
                P_DATA <= P_DATA_reg ; // store fully received byte
            end    
    end

    // shift in serial data into P_DATA_reg at the position indicated by counter
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n) 
            begin
                P_DATA_reg <= 8'd0 ; // reset temp register
            end    
        else if(enable)
            begin
                P_DATA_reg[counter] <= serial_data ; // store incoming bit
            end    
    end

    // 3-bit counter to track number of received bits
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n)
            begin
                counter <= 4'd0 ; // reset counter
            end
        else if (enable && !counter_max) 
            begin
                counter <= counter + 1'b1 ; // increment counter
            end    
        else if (counter_max)
            begin
                counter <= 4'd0 ; // reset counter when not enabled or max reached
            end    
    end
endmodule