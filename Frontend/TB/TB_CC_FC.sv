package TB_CC_FC ;
    
    typedef enum bit [7:0] {RF_WR = 8'hAA, RF_RD = 8'hBB, ALU_OP = 8'hCC, ALU_NOP = 8'hDD} Command_e ;
    
class SYSTEM_Transaction ;
    rand bit RST_N    ;
    bit UART_CLK      ;
    bit REF_CLK       ;
    bit UART_RX_IN    ;
    bit UART_TX_O     ;
    bit parity_error  ;
    bit framing_error ;

    logic [5:0] Prescale ; 
    logic [7:0] Address  ; 
    logic       PAR_EN   ; 
    logic       PAR_TYPE ;

    rand Command_e Start_cmd  ; 
    rand bit [7:0] legal_addr ; 
    rand bit [3:0] OP_Code    ;
    rand bit [7:0] Operand_A, Operand_B ;
    rand bit [7:0] W_Rand_data ;
    /*------------------------------- Constraints For Randmization --------------------------- */
    constraint c_rst {RST_N dist {1:= 10, 0:= 90};} // Most of the Reset is De-asserted  
    constraint c_legal_addr 
    {
        if (Start_cmd == RF_WR || Start_cmd == RF_RD) 
            legal_addr inside {[8'd4 : 8'd15]};
    }
    constraint c_opcode {OP_Code dist {[0:14]:/98, 15:/2};} // Most of the op code is a valid opocode
    constraint C_OP_A   {Operand_A dist {[1:254]:/70 , 0:/15, 255:/15};}
    constraint C_OP_B   {Operand_B dist {[1:254]:/70 , 0:/15, 255:/15};}

    /*------------------------------- Functioanl Coverage --------------------------- */
       covergroup func_cvg @(posedge UART_CLK);
            coverpoint Start_cmd 
            {
                bins rf_wr     = {8'hAA};
                bins rf_rd     = {8'hBB};
                bins alu_w_op  = {8'hCC};
                bins alu_wo_op = {8'hDD};
            }
        endgroup

        covergroup cg_reg @(posedge REF_CLK);
            coverpoint Address 
            {
                bins confg  = {[8'd00:8'd03]};
                bins normal = {[8'd04:8'd15]};
            }
        endgroup
            covergroup cg_alu @(posedge REF_CLK);
                coverpoint OP_Code 
                {
                    bins add      = {4'h0};
                    bins sub      = {4'h1};
                    bins mul      = {4'h2};
                    bins div      = {4'h3};
                    bins logical  = {[4'h4:4'h9]}; // AND..XNOR
                    bins cmp      = {[4'hA:4'hB]}; // CMP_EQ..CMP_LT
                    bins shifts   = {[4'hC:4'hD]}; // Right..Left
                }
                coverpoint Operand_A { bins zero = {0}; bins max = {8'hFF}; }
                coverpoint Operand_B { bins zero = {0}; bins max = {8'hFF}; }
            endgroup
                covergroup cg_uart @(posedge UART_CLK);
                    coverpoint PAR_EN   { bins on = {1}; bins off = {0}; }
                    coverpoint PAR_TYPE { bins even = {0}; bins odd = {1}; }
                    coverpoint Prescale 
                    {
                        bins p8  = {8};
                        bins p16 = {16};
                        bins p32 = {32};
                    }
                endgroup

    function new ();
        func_cvg = new() ; 
        cg_reg   = new() ; 
        cg_alu   = new() ; 
        cg_uart  = new() ; 
    endfunction
endclass
endpackage