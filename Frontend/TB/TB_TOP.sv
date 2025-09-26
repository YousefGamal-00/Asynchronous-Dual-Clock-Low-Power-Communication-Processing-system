`timescale 1ns/1ps
import TB_CC_FC::* ;

module TB_TOP ;

/*--------------------------TB Local Parameters + Variables----------------------*/
    localparam UART_CLK_PER = 271.27 ;
    localparam REF_CLK_PER  = 20     ;

    localparam bit STOP_BIT     = 1'b1   ;
    localparam bit START_BIT    = 1'b0   ;
/*--------------------------DUT Singals----------------------*/
    logic RST_N         ;
    logic REF_CLK       ;
    logic UART_CLK      ;
    logic UART_RX_IN    ;
    logic UART_TX_O     ;
    logic parity_error  ;
    logic framing_error ;
    
/*--------------------------DUT Instantiation----------------------*/
SYS_TOP DUT (.*); 

/*--------------------------CLock Generation----------------------*/
initial 
begin
    UART_CLK = 1'b0 ;
    REF_CLK  = 1'b0 ;
    fork
        // Thread 1 :- Generate UART clock 
        begin
            forever 
                begin        
                    #(UART_CLK_PER/2) UART_CLK = ~UART_CLK ; 
                    Rand_data.UART_CLK = UART_CLK ;
                end
        end
        // Thread 2 :- Generate REF clock 
        begin
            forever 
                begin        
                    #(REF_CLK_PER/2) REF_CLK = ~REF_CLK ; 
                    Rand_data.REF_CLK = REF_CLK ;
                end
        end
    join     
end
/*-------------------------- Bind the Assertions ----------------------*/
bind DUT TB_SVA u_TB_SVA 
(
  .RST_N        (RST_N)                     ,
  .REF_CLK      (REF_CLK)                   ,
  .UART_CLK     (UART_CLK)                  ,
  .UART_RX_IN   (UART_RX_IN)                ,
  .PAR_ERR      (parity_error)              ,
  .STP_ERR      (framing_error)             ,
  .OUT_VALID    (DUT.U0_ALU.OUT_VALID)      ,
  .RdData_Valid (DUT.U0_RegFile.RdValid)    ,
  .CLK_EN       (DUT.U0_SYS_CTRL.CLK_EN)    ,
  .FULL         (DUT.U0_ASYNC_FIFO.FULL)    ,
  .R_INC        (DUT.U0_ASYNC_FIFO.R_INC)   ,
  .W_INC        (DUT.U0_ASYNC_FIFO.W_INC)   ,
  .EMPTY        (DUT.U0_ASYNC_FIFO.EMPTY)   ,
  .GATED_CLK    (DUT.U0_CLK_GATE.GATED_CLK) ,
  .TX_D_VLD     (DUT.U0_SYS_CTRL.TX_D_VLD)  
);

/*--------------------------Testbnech logic----------------------*/
    SYSTEM_Transaction Rand_data ;
initial 
begin
    $dumpfile("SYSTEM.vcd");
    $dumpvars();
    $display("#####################################################");
    $display("--------------------Start Simulation-----------------");
        Rand_data = new() ;
        init_task();
        assert_reset();
        /*-------- Randomize 100 Command to test the Functioanlity in Default Configurations ------------*/
        repeat(100)
            begin
                assert(Rand_data.randomize()); 
                if     (Rand_data.Start_cmd == RF_WR  ) REG_FILE_WR   ();
                else if(Rand_data.Start_cmd == RF_RD  ) REG_FILE_RD   ();
                else if(Rand_data.Start_cmd == ALU_OP ) ALU_Change_OP ();
                else if(Rand_data.Start_cmd == ALU_NOP) ALU_Default_OP();
                CONNECT_TB_TO_CLASS(Rand_data.legal_addr);
            end
        /*----------------------- Change the Prescale Configurations to 16 --------------------------*/
        assert_reset();
        Send_Frame(RF_WR  , ^RF_WR );
        Send_Frame(8'd2   , ^(8'd2) );
        Send_Frame(8'h41  , ^(8'h41)); 
        CONNECT_TB_TO_CLASS(8'd2);
    
        repeat(100)
            begin
                assert(Rand_data.randomize()); 
                if     (Rand_data.Start_cmd == RF_WR  ) REG_FILE_WR   ();
                else if(Rand_data.Start_cmd == RF_RD  ) REG_FILE_RD   ();
                else if(Rand_data.Start_cmd == ALU_OP ) ALU_Change_OP ();
                else if(Rand_data.Start_cmd == ALU_NOP) ALU_Default_OP();
                CONNECT_TB_TO_CLASS(Rand_data.legal_addr);
            end
        /*----------------------- Change the Prescale Configurations to 8 --------------------------*/
        assert_reset();
        Send_Frame(RF_WR  , ^RF_WR );
        Send_Frame(8'd2   , ^(8'd2) );
        Send_Frame(8'h21  , ^(8'h41)); 
    
        repeat(100)
            begin
                assert(Rand_data.randomize()); 
                if     (Rand_data.Start_cmd == RF_WR  ) REG_FILE_WR   ();
                else if(Rand_data.Start_cmd == RF_RD  ) REG_FILE_RD   ();
                else if(Rand_data.Start_cmd == ALU_OP ) ALU_Change_OP ();
                else if(Rand_data.Start_cmd == ALU_NOP) ALU_Default_OP();
                CONNECT_TB_TO_CLASS(Rand_data.legal_addr);
            end

        assert_reset();
        /*---- Change the parity Type and Pairty Enable configurations */
        /*---- then write a frame with wrong configurations to test error flags */
        repeat(2)
            begin                
                Send_Frame(RF_WR    , ^RF_WR  );
                Send_Frame(8'd2     , ^(8'd2) );
                Config_Parity(8'h23 , ^(8'h23), 8'd2);
            end
        /*-------- Add Extra Test vectors to increase the coverage ------------*/
        /*---- Write in Config Locations in Register file */
        repeat(10)
            begin
                Send_Frame(RF_WR  , ^RF_WR );
                Send_Frame(8'd0   , ^(8'd0) );
                Send_Frame(Rand_data.W_Rand_data , ^(Rand_data.W_Rand_data)); 
                CONNECT_TB_TO_CLASS(8'd0);

                Send_Frame(RF_WR  , ^RF_WR );
                Send_Frame(8'd1   , ^(8'd1) );
                Send_Frame(Rand_data.W_Rand_data , ^(Rand_data.W_Rand_data)); 
                CONNECT_TB_TO_CLASS(8'd1);
            end
        /*---- Add a wrong Stop Bit to check the framing error */
                Send_Frame(RF_WR  , ^RF_WR  );
                Send_Frame(8'd15   , ^(8'd15) );
                Send_Wrong_Frame(Rand_data.W_Rand_data , ^(Rand_data.W_Rand_data)); 
                CONNECT_TB_TO_CLASS(8'd15);
        repeat(50) @(negedge UART_CLK) ;


    $display("--------------------End   Simulation-----------------");
    $display("#####################################################");
    repeat(50) @(negedge UART_CLK) ;
    $stop;
end

/*----------------------------- assert_reset -----------------------------*/
task assert_reset();
    RST_N = 1'b0 ; 
    @(negedge UART_CLK) ; 
    RST_N = 1'b1 ; 
endtask 
/*----------------------------- init_task -----------------------------*/
task init_task();
    UART_RX_IN = 1'b1 ; // IDLE state of bus
endtask 

/*----------------------------- Config_Parity -----------------------------*/
task Config_Parity(input bit [7:0] data, input bit parity, input bit [7:0] Addr);
    bit [10:0] Frame;
    int i;
        begin
            Frame = {STOP_BIT, parity, data, START_BIT};
            @(negedge DUT.U0_UART.TX_CLK);
            for (i = 0; i < 11; i++) 
            begin
                UART_RX_IN = Frame[i];
                CONNECT_TB_TO_CLASS(Addr);
                @(negedge DUT.U0_UART.TX_CLK);
            end
        end
endtask
/*----------------------------- Send_Frame -----------------------------*/
task Send_Frame(input bit [7:0] data, input bit parity);
    bit [10:0] Frame;
    int i;
        begin
            Frame = {STOP_BIT, parity, data, START_BIT};
            @(negedge DUT.U0_UART.TX_CLK);
            for (i = 0; i < 11; i++) 
            begin
                UART_RX_IN = Frame[i];
                @(negedge DUT.U0_UART.TX_CLK);
            end
        end
endtask

/*----------------------------- Send_Wrong_Frame -----------------------------*/
task Send_Wrong_Frame(input bit [7:0] data, input bit parity);
    bit [10:0] Wrong_Frame;
    int i;
        begin
            Wrong_Frame = {!STOP_BIT, parity, data, START_BIT};
            @(negedge DUT.U0_UART.TX_CLK);
            for (i = 0; i < 11; i++) 
            begin
                UART_RX_IN = Wrong_Frame[i];
                @(negedge DUT.U0_UART.TX_CLK);
            end
        end
endtask

/*----------------------------- REG_FILE_WR -----------------------------*/
task REG_FILE_WR();
    Send_Frame(Rand_data.Start_cmd   , ^Rand_data.Start_cmd    );
    Send_Frame(Rand_data.legal_addr  , ^Rand_data.legal_addr   );
    Send_Frame(Rand_data.W_Rand_data , ^(Rand_data.W_Rand_data)); 
endtask
/*----------------------------- REG_FILE_RD -----------------------------*/
task REG_FILE_RD();
    Send_Frame(Rand_data.Start_cmd   , ^Rand_data.Start_cmd    );
    Send_Frame(Rand_data.legal_addr  , ^Rand_data.legal_addr   );

    FIFO_READ(DUT.U0_RegFile.REG_FILE[Rand_data.legal_addr] , 
             ^(DUT.U0_RegFile.REG_FILE[Rand_data.legal_addr]) ) ;
endtask
/*----------------------------- ALU_Change_OP -----------------------------*/
task ALU_Change_OP();
    Send_Frame(Rand_data.Start_cmd   , ^Rand_data.Start_cmd );
    Send_Frame(Rand_data.Operand_A   , ^Rand_data.Operand_A);
    Send_Frame(Rand_data.Operand_B   , ^Rand_data.Operand_B);
    Send_Frame(Rand_data.OP_Code     , ^(Rand_data.OP_Code));

    FIFO_READ_ALU_OP(Rand_data.Operand_A, Rand_data.Operand_B, Rand_data.OP_Code) ;
endtask

/*----------------------------- ALU_Default_OP -----------------------------*/
task ALU_Default_OP();
    Send_Frame(Rand_data.Start_cmd  , ^Rand_data.Start_cmd);
    Send_Frame(Rand_data.OP_Code    , ^Rand_data.OP_Code  );

    FIFO_READ_ALU_OP(DUT.U0_RegFile.REG0, DUT.U0_RegFile.REG1, Rand_data.OP_Code) ;

endtask

/*----------------------------- FIFO_READ -----------------------------*/
task FIFO_READ(input bit [7:0] exp_data, input bit parity);
    bit [10:0] Frame ;
    int i ;
        begin
            @(posedge DUT.U0_UART.TX_OUT_V);
            for (i = 0 ; i<11 ; i++) 
                begin
                    @(negedge DUT.U0_UART.TX_CLK) ;  
                    Frame[i] = UART_TX_O ;
                end
            if(exp_data !== Frame[8:1])  
                begin
                    $display(" Error in FIFO read Data ");
                    $stop ;
                end
            if(parity !== Frame[9])  
                begin
                    $display(" Error in FIFO read parity ");
                    $stop ;
                end
        end
endtask
/*----------------------------- FIFO_READ_ALU_OP -----------------------------*/
task FIFO_READ_ALU_OP(input bit [7:0] A, B, input bit [3:0] OPCODE);
    bit [15:0] real_result, exp_result ;
    bit [10:0] Frame_LSB, Frame_MSB ;
    int i ;
        begin
            case (OPCODE)
            4'b0000: exp_result = A + B ;                      
            4'b0001: exp_result = A - B ;                      
            4'b0010: exp_result = A * B ;                      
            4'b0011: exp_result = (B) ? A / B : {16{1'b1}}; 
            4'b0100: exp_result = A & B ;                      
            4'b0101: exp_result = A | B ;                      
            4'b0110: exp_result = ~(A & B) ;                   
            4'b0111: exp_result = ~(A | B) ;                   
            4'b1000: exp_result = A ^ B ;                      
            4'b1001: exp_result = ~(A ^ B) ;                   
            4'b1010: exp_result = (A == B) ? 1'b1  : 1'b0 ;      
            4'b1011: exp_result = (A >  B) ? 2'b10 : 2'b0 ;      
            4'b1100: exp_result = (A <  B) ? 2'b11 : 2'b0 ;      
            4'b1101: exp_result = A >> 1 ;                     
            4'b1110: exp_result = A << 1 ;                     
            default: exp_result = 'd0 ;                        
        endcase 

            @(posedge DUT.U0_UART.TX_OUT_V);
            for (i = 0 ; i<11 ; i++) 
                begin
                    @(negedge DUT.U0_UART.TX_CLK) ;  
                    Frame_LSB[i] = UART_TX_O ;
                end
            @(posedge DUT.U0_UART.TX_OUT_V);
            for (i = 0 ; i<11 ; i++) 
                begin
                    @(negedge DUT.U0_UART.TX_CLK) ;  
                    Frame_MSB[i] = UART_TX_O ;
                end

            real_result = {Frame_MSB[8:1], Frame_LSB[8:1]} ; 

            if(real_result !== exp_result)  
                begin
                    $display(" Error in FIFO read Data (ALU) ");
                    $stop ;
                end
        end
endtask
/*------------------------ CONNECT_TB_TO_CLASS ------------------------*/
task CONNECT_TB_TO_CLASS(input logic [7:0] addr) ;
    begin
        Rand_data.parity_error  = parity_error  ;
        Rand_data.framing_error = framing_error ;
        Rand_data.Address       =  addr         ;
        Rand_data.PAR_EN        = DUT.U0_UART.PAR_EN   ; 
        Rand_data.PAR_TYPE      = DUT.U0_UART.PAR_TYP  ;
        Rand_data.Prescale      = DUT.U0_UART.Prescale ; 
      
    end
endtask
endmodule