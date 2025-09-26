module UART_RX_FSM 
(
    input wire       clk          , 
    input wire       rst_n        , 
    input wire       RX_IN        ,
    input wire       PAR_EN       , 
    input wire [5:0] Prescale     , 
    input wire [4:0] edge_cnt     ,
    input wire [3:0] bit_cnt      , 
    input wire       par_err      , 
    input wire       stp_err      , 
    input wire       start_glitch ,
    output reg       dat_samp_en  , 
    output reg       edge_en      , 
    output reg       deser_en     ,
    output reg       par_chk_en   ,
    output reg       strt_chk_en  ,
    output reg       stp_chk_en   ,
    output reg       data_valid   , 
    output reg       parity_error , 
    output reg       stop_error   
);

    localparam IDLE   = 3'b000 ; 
    localparam START  = 3'b001 ; 
    localparam DATA   = 3'b011 ; 
    localparam PARITY = 3'b010 ; 
    localparam STOP   = 3'b110 ; 
    localparam VALID  = 3'b111 ; 

    reg  [2:0] Current_state , Next_state ; 
    reg error_par , error_stp ; 
    wire [4:0] Last_edge ;

    assign Last_edge = Prescale - 1'b1 ; 

    //-----------------------
    // State memory
    //-----------------------
    always @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n) 
            begin
                Current_state <= IDLE ;
            end    
        else     
            begin
                Current_state <= Next_state ;
            end    
    end

    //----------------------------------------------------
    // Next_state logic 
    //----------------------------------------------------
    always @(*) 
    begin
        case (Current_state)
            IDLE : 
                begin
                    if(RX_IN)
                        begin
                            Next_state = IDLE ; 
                        end  
                    else      
                        begin
                            Next_state = START ; 
                        end    
                end 
            START : 
                begin
                    if(start_glitch)
                        begin
                            Next_state = IDLE ; 
                        end    
                    else if (edge_cnt == Last_edge)
                        begin
                            Next_state = DATA ;
                        end    
                    else
                        begin
                            Next_state = START ; 
                        end    
                end 
            DATA : 
                begin
                    if(PAR_EN && (bit_cnt == 4'd8) && (edge_cnt == Last_edge))
                        begin
                            Next_state = PARITY ; 
                        end 
                    else if(!PAR_EN && (bit_cnt == 4'd8) && (edge_cnt == Last_edge))
                        begin
                            Next_state = STOP ; 
                        end 
                    else
                        begin
                            Next_state = DATA ; 
                        end 
                end 
            PARITY : 
                begin
                    if (Last_edge == edge_cnt)    
                        begin
                            Next_state = STOP ; 
                        end
                    else     
                        begin
                            Next_state = PARITY ; 
                        end
                end 
            STOP : 
                begin

                    if (edge_cnt == (Last_edge - 1'b1)) // assert valid in the last cycle of STOP state    
                        begin
                            Next_state = VALID ; 
                        end
                    else     
                        begin
                            Next_state = STOP ; 
                        end                        
                end 
            VALID : 
                begin
                    if(RX_IN)
                        begin
                            Next_state = IDLE ; 
                        end
                    else     
                        begin
                            Next_state = START ; 
                        end
                end 
            default: 
                begin
                    Next_state = IDLE ; 
                end 
        endcase
    end
    
    //------------------------------------------------------------
    // Output & control logic
    //------------------------------------------------------------
    always @(*) 
    begin
        edge_en      = 1'b0 ;
        deser_en     = 1'b0 ; 
        stp_chk_en   = 1'b0 ; 
        par_chk_en   = 1'b0 ; 
        data_valid   = 1'b0 ; 
        stop_error   = 1'b0 ; 
        strt_chk_en  = 1'b0 ;
        dat_samp_en  = 1'b0 ;
        parity_error = 1'b0 ;  

        case (Current_state)
            IDLE : 
                begin
                    data_valid  = 1'b0 ;    
                    dat_samp_en = 1'b0 ; 
                    edge_en     = 1'b0 ; 
                end 
            START : 
                begin
                    data_valid  = 1'b0 ;
                    edge_en     = 1'b1 ; 
                    dat_samp_en = 1'b1 ; 

                    if(edge_cnt == Prescale - 2'd2)
                        strt_chk_en = 1'b1 ;  
                    else     
                        strt_chk_en = 1'b0 ; 
                end 
            DATA : 
                begin
                    dat_samp_en = 1'b1 ;                     
                    edge_en     = 1'b1 ; 

                    if(edge_cnt == Last_edge)
                        begin
                            deser_en = 1'b1 ;  
                        end
                    else
                        begin
                            deser_en = 1'b0 ;  
                        end
                 end 
            PARITY : 
                begin
                    dat_samp_en = 1'b1 ;  
                    edge_en     = 1'b1 ;

                    if(edge_cnt == Prescale - 2'd2)
                        par_chk_en  = 1'b1 ;
                    else
                        par_chk_en  = 1'b0 ;
                end 
            STOP : 
                begin
                    edge_en     = 1'b1 ;
                    dat_samp_en = 1'b1 ;  
                    if(edge_cnt == Prescale - 2'd2)
                        stp_chk_en  = 1'b1 ;    
                    else
                        stp_chk_en  = 1'b0 ;
                end 
            VALID : 
                begin
                    if(par_err || stp_err)
                        begin
                            data_valid   = 1'b0 ;
                            stop_error   = stp_err ;
                            parity_error = par_err ;
                        end
                    else     
                        begin
                            data_valid   = 1'b1 ;
                            stop_error   = 1'b0 ;
                            parity_error = 1'b0 ;
                        end
                end 
            default: 
                begin
                    error_stp    = 1'b0 ; 
                    error_par    = 1'b0 ; 
                    edge_en      = 1'b0 ;
                    deser_en     = 1'b0 ; 
                    stp_chk_en   = 1'b0 ; 
                    par_chk_en   = 1'b0 ; 
                    data_valid   = 1'b0 ; 
                    stop_error   = 1'b0 ; 
                    strt_chk_en  = 1'b0 ;  
                    dat_samp_en  = 1'b0 ;  
                    parity_error = 1'b0 ; 
                end 
        endcase
    end
endmodule