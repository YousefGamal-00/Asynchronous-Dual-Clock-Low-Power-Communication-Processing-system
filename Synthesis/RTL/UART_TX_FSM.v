module UART_FSM  
(
    input  wire       clk        ,  // System clock
    input  wire       RST_n      ,  // Asynchronous active-low reset
    input  wire       ser_done   ,  // Serialization done flag
    input  wire       par_bit    ,  // Parity bit from parity generator
    input  wire       ser_data   ,  // Serial data from serializer
    input  wire       Data_Valid ,  // Input data valid signal
    input  wire       PAR_EN     ,  // Parity enable signal
    output reg        ser_en     ,  // Serializer enable signal
    output reg        Load       ,  // Load signal for registering the data
    output reg        TX_OUT     ,  // Serial data output
    output wire       busy          // Busy status flag
);

// UART frame control bits
localparam Start_bit = 1'b0 ;  // Start bit is always 0
localparam End_bit   = 1'b1 ;  // Stop bit (idle line) is always 1

// Gray-encoded FSM states
localparam UART_IDLE  = 3'b000 ;  // Idle state, waiting for data
localparam UART_START = 3'b001 ;  // Start bit transmission
localparam UART_DATA  = 3'b011 ;  // Transmitting data bits
localparam UART_PAR   = 3'b010 ;  // Parity bit transmission
localparam UART_STOP  = 3'b110 ;  // Stop bit transmission

reg [2:0] Current_state , Next_state ; // FSM current and next state

// ---------------------------
// State register (state memory)
// ---------------------------
always @(posedge clk or negedge RST_n) 
begin
    if(!RST_n)
        begin
            Current_state <= UART_IDLE ;  // Reset to IDLE state
        end    
    else 
        begin
            Current_state <= Next_state ; // Transition to next state
        end    
end

// ---------------------------
// Next-state logic
// ---------------------------
always @(*) 
begin
    case (Current_state)        
        UART_IDLE : 
                    begin
                        if (Data_Valid)                  // Triggered by Data_Valid
                            begin
                                Next_state = UART_START ; // Move to Start state
                            end
                        else
                            begin
                                Next_state = UART_IDLE ;  // Remain in Idle
                            end
                    end
        UART_START : 
                    begin
                        Next_state = UART_DATA ;          // Move to Data state
                    end
        UART_DATA : 
                    begin
                        if(ser_done && PAR_EN)            // Data done and parity enabled
                            begin
                                Next_state = UART_PAR ;   // Move to Parity state
                            end
                        else if(ser_done && !PAR_EN)      // Data done without parity
                            begin
                                Next_state = UART_STOP ;  // Move directly to Stop state
                            end
                        else
                            begin
                                Next_state = UART_DATA ;  // Stay in Data state
                            end
                    end
        UART_PAR : 
                    begin
                        Next_state = UART_STOP ;          // Move to Stop state after parity
                    end
        UART_STOP : 
                    begin
                        Next_state = UART_IDLE ;          // Return to Idle after stop
                    end
        default: Next_state = UART_IDLE ;                 // Default to Idle state
    endcase    
end

// ---------------------------
// Output logic (Moore-style FSM)
// ---------------------------
always @(*) 
begin
    ser_en = 1'b0    ; // Default: serializer disabled
    Load   = 1'b0    ; // Default: Load disabled
    TX_OUT = End_bit ; // Default: TX line is high (idle)
    
    case (Current_state)
        UART_IDLE : begin
                        TX_OUT = End_bit ;              // Line idle
                        ser_en = 1'b0 ;                 // Serializer disabled
                        if (Data_Valid && !busy)
                            Load = 1'b1 ;               // Enable serializer to Load the parallel data
                        else     
                            Load = 1'b0 ;               // Disable serializer Loading
                    end
        UART_START : begin
                        TX_OUT = Start_bit ;            // Send start bit
                        ser_en = 1'b1      ;            // Serializer enabled during start **********************
                        Load   = 1'b0      ;            // Disable serializer Loading
                    end
        UART_DATA : begin
                        Load   = 1'b0     ;             // Disable serializer Loading
                        ser_en = 1'b1     ;             // Enable the serial Data
                        TX_OUT = ser_data ;             // Send serial data bit
                    end
        UART_PAR : begin
                        Load   = 1'b0    ;              // Disable serializer Loading
                        ser_en = 1'b0    ;              // Serializer disabled
                        TX_OUT = par_bit ;              // Send parity bit
                    end
        UART_STOP : begin
                        Load   = 1'b0    ;              // Disable serializer Loading
                        ser_en = 1'b0    ;              // Serializer disabled
                        TX_OUT = End_bit ;              // Send stop bit
                    end
        default   : begin
                        ser_en = 1'b0    ;              // Serializer disabled
                        Load   = 1'b0    ;              // Disable serializer Loading
                        TX_OUT = End_bit ;              // Default to idle line
                    end 
    endcase
end

assign busy = (Current_state == UART_IDLE)? 1'b0 : 1'b1 ; // Busy when not in IDLE
endmodule
