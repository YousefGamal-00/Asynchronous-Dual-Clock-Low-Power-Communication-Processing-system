onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {TB Signals} /TB_TOP/RST_N
add wave -noupdate -group {TB Signals} /TB_TOP/REF_CLK
add wave -noupdate -group {TB Signals} /TB_TOP/UART_CLK
add wave -noupdate -group {TB Signals} /TB_TOP/UART_RX_IN
add wave -noupdate -group {TB Signals} /TB_TOP/UART_TX_O
add wave -noupdate -group {TB Signals} /TB_TOP/parity_error
add wave -noupdate -group {TB Signals} /TB_TOP/framing_error
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {Recieved Frame}
add wave -noupdate -radix binary /TB_TOP/FIFO_READ/Frame
add wave -noupdate -divider <NULL>
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/TX_CLK
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/RX_CLK
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/RST
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/PAR_TYP
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/PAR_EN
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/Prescale
add wave -noupdate -group UART -color Cyan -radix unsigned /TB_TOP/DUT/U0_UART/RX_IN_S
add wave -noupdate -group UART -color Cyan -radix unsigned /TB_TOP/DUT/U0_UART/RX_OUT_P
add wave -noupdate -group UART -color Cyan -radix unsigned /TB_TOP/DUT/U0_UART/RX_OUT_V
add wave -noupdate -group UART -color Gold -radix unsigned /TB_TOP/DUT/U0_UART/TX_IN_P
add wave -noupdate -group UART -color Gold -radix unsigned /TB_TOP/DUT/U0_UART/TX_IN_V
add wave -noupdate -group UART -color Magenta -radix unsigned /TB_TOP/DUT/U0_UART/TX_OUT_S
add wave -noupdate -group UART -color Red -radix unsigned /TB_TOP/DUT/U0_UART/TX_OUT_V
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/parity_error
add wave -noupdate -group UART -radix unsigned /TB_TOP/DUT/U0_UART/stop_error
add wave -noupdate -divider {8-bit data sync}
add wave -noupdate /TB_TOP/Send_Frame/data
add wave -noupdate /TB_TOP/Send_Frame/parity
add wave -noupdate /TB_TOP/Send_Frame/Frame
add wave -noupdate -radix unsigned /TB_TOP/Send_Frame/i
add wave -noupdate -divider <NULL>
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/CLK
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/RST
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/BUS_EN
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/unsync_bus
add wave -noupdate -group {Data SYNC} -color Gold /TB_TOP/DUT/U0_ref_Data_sync/sync_bus
add wave -noupdate -group {Data SYNC} -color Gold /TB_TOP/DUT/U0_ref_Data_sync/enable_pulse
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/en_reg
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/sync_en
add wave -noupdate -group {Data SYNC} /TB_TOP/DUT/U0_ref_Data_sync/Pulse_en
add wave -noupdate -divider <NULL>
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/W_CLK
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/W_RST
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/W_INC
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/R_CLK
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/R_RST
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/R_INC
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/WR_DATA
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/RD_DATA
add wave -noupdate -group {ASYNC FIFO} -color Magenta /TB_TOP/DUT/U0_ASYNC_FIFO/FULL
add wave -noupdate -group {ASYNC FIFO} -color Magenta /TB_TOP/DUT/U0_ASYNC_FIFO/EMPTY
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/W_ADDRESS
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/R_ADDRESS
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/A_G_w_ptr
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/A_G_R_ptr
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/S_G_w_ptr
add wave -noupdate -group {ASYNC FIFO} /TB_TOP/DUT/U0_ASYNC_FIFO/S_G_R_ptr
add wave -noupdate -divider <NULL>
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/i_ref_clk
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/i_rst_n
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/i_div_ratio
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/o_div_clk
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/counter
add wave -noupdate -group {TX CLK DIV} /TB_TOP/DUT/U0_ClkDiv/G_enable
add wave -noupdate -divider <NULL>
add wave -noupdate -group {RX CLK MUX} -radix unsigned /TB_TOP/DUT/U0_CLKDIV_MUX/IN
add wave -noupdate -group {RX CLK MUX} -radix unsigned /TB_TOP/DUT/U0_CLKDIV_MUX/OUT
add wave -noupdate -divider <NULL>
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/i_ref_clk
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/i_rst_n
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/i_div_ratio
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/o_div_clk
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/counter
add wave -noupdate -group {RX CLK DIV} /TB_TOP/DUT/U1_ClkDiv/G_enable
add wave -noupdate -divider <NULL>
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/CLK
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/RST
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/RX_ENABLE
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/RX_P_DATA
add wave -noupdate -group {SYS CTRL} -divider Reg_file
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Wr_En
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Rd_En
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Address
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Wr_Data
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Rd_Data
add wave -noupdate -group {SYS CTRL} -color Gold /TB_TOP/DUT/U0_SYS_CTRL/Rd_Data_Valid
add wave -noupdate -group {SYS CTRL} -divider ALU
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/CLK_EN
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/ALU_EN
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/ALU_FUN
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/ALU_OUT
add wave -noupdate -group {SYS CTRL} -color Cyan /TB_TOP/DUT/U0_SYS_CTRL/ALU_Valid
add wave -noupdate -group {SYS CTRL} -divider FIFO
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/TX_P_DATA
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/TX_D_VLD
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/FIFO_FULL
add wave -noupdate -group {SYS CTRL} -divider States
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/Current_State
add wave -noupdate -group {SYS CTRL} /TB_TOP/DUT/U0_SYS_CTRL/Next_State
add wave -noupdate -group {SYS CTRL} -color Cyan -radix unsigned /TB_TOP/DUT/U0_SYS_CTRL/W_add_reg
add wave -noupdate -divider <NULL>
add wave -noupdate -group REG_FILE -radix unsigned /TB_TOP/DUT/U0_RegFile/CLK
add wave -noupdate -group REG_FILE -radix unsigned /TB_TOP/DUT/U0_RegFile/RST
add wave -noupdate -group REG_FILE -color Cyan -radix unsigned /TB_TOP/DUT/U0_RegFile/Address
add wave -noupdate -group REG_FILE -color Magenta -radix unsigned /TB_TOP/DUT/U0_RegFile/WrEn
add wave -noupdate -group REG_FILE -radix unsigned /TB_TOP/DUT/U0_RegFile/RdEn
add wave -noupdate -group REG_FILE -color Magenta -radix unsigned /TB_TOP/DUT/U0_RegFile/WrData
add wave -noupdate -group REG_FILE -radix unsigned /TB_TOP/DUT/U0_RegFile/RdData
add wave -noupdate -group REG_FILE -radix unsigned /TB_TOP/DUT/U0_RegFile/RdValid
add wave -noupdate -group REG_FILE -color Gold -radix unsigned /TB_TOP/DUT/U0_RegFile/REG0
add wave -noupdate -group REG_FILE -color Gold -radix unsigned /TB_TOP/DUT/U0_RegFile/REG1
add wave -noupdate -group REG_FILE -color Cyan -radix unsigned /TB_TOP/DUT/U0_RegFile/REG2
add wave -noupdate -group REG_FILE -color Cyan -radix unsigned /TB_TOP/DUT/U0_RegFile/REG3
add wave -noupdate -group REG_FILE -radix unsigned -childformat {{{/TB_TOP/DUT/U0_RegFile/REG_FILE[15]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[14]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[13]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[12]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[11]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[10]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[9]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[8]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[7]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[6]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[5]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[4]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[3]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[2]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[1]} -radix unsigned} {{/TB_TOP/DUT/U0_RegFile/REG_FILE[0]} -radix unsigned}} -expand -subitemconfig {{/TB_TOP/DUT/U0_RegFile/REG_FILE[15]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[14]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[13]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[12]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[11]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[10]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[9]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[8]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[7]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[6]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[5]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[4]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[3]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[2]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[1]} {-height 15 -radix unsigned} {/TB_TOP/DUT/U0_RegFile/REG_FILE[0]} {-height 15 -radix unsigned}} /TB_TOP/DUT/U0_RegFile/REG_FILE
add wave -noupdate -divider <NULL>
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/CLK
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/RST
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/EN
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/A
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/B
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/ALU_FUN
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/ALU_OUT
add wave -noupdate -group ALU -radix unsigned /TB_TOP/DUT/U0_ALU/OUT_VALID
add wave -noupdate -divider <NULL>
add wave -noupdate -group {CLK GATE} /TB_TOP/DUT/U0_CLK_GATE/CLK
add wave -noupdate -group {CLK GATE} /TB_TOP/DUT/U0_CLK_GATE/CLK_EN
add wave -noupdate -group {CLK GATE} /TB_TOP/DUT/U0_CLK_GATE/GATED_CLK
add wave -noupdate -divider <NULL>
add wave -noupdate -group {UART RST SYNC} /TB_TOP/DUT/U0_RST_SYNC/CLK
add wave -noupdate -group {UART RST SYNC} /TB_TOP/DUT/U0_RST_SYNC/RST
add wave -noupdate -group {UART RST SYNC} /TB_TOP/DUT/U0_RST_SYNC/SYNC_RST
add wave -noupdate -group {UART RST SYNC} /TB_TOP/DUT/U0_RST_SYNC/RST_reg
add wave -noupdate -divider <NULL>
add wave -noupdate -group {REF RST SYNC} /TB_TOP/DUT/U1_RST_SYNC/CLK
add wave -noupdate -group {REF RST SYNC} /TB_TOP/DUT/U1_RST_SYNC/RST
add wave -noupdate -group {REF RST SYNC} /TB_TOP/DUT/U1_RST_SYNC/SYNC_RST
add wave -noupdate -group {REF RST SYNC} /TB_TOP/DUT/U1_RST_SYNC/RST_reg
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_no_framing_error
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_no_parity_error
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_TX_D_VLD_once
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_RdData_Valid_once
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_OUT_VALID_once
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_fifo_no_write_full
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_result_regfile
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_result_tx
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_fifo_no_read_empty
add wave -noupdate /TB_TOP/DUT/u_TB_SVA/cover__p_clk_gate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {63388573471 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 204
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {151259420770 ps} {152696621632 ps}
