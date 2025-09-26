
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/IC/Final_Project/Synthesis/Syn/$top_module.svf"

###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################


# Read Reference Design Verilog Files
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_TX_FSM.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_TX_Parity.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_TX_Serializer.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_TX_Top.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_deserializer.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_edge_counter.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_FSM.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_parity_check.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_sampler.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_start_check.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_stop_check.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_RX_Top.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/UART_TOP.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/SYS_CTRL.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ALU.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/RegFile.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/DATA_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/PULSE_GEN.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ASYNC_FIFO_BIT_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ASYNC_FIFO_MEM.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ASYNC_FIFO_RD.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ASYNC_FIFO_WR.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/ASYNC_FIFO_TOP.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/Clk_Divider.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/CLK_GATE.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/RST_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/CLKDIV_MUX.v"
read_verilog -container Ref "/home/IC/Final_Project/Synthesis/RTL/SYS_TOP.v"

# Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

# Read Implementation Design Files
read_verilog -container Imp -netlist "/home/IC/Final_Project/Synthesis/Syn/netlists/SYS_TOP.v"

# Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_implementation_design $top_module
set_top $top_module


###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points    > "passing_points.rpt"
report_failing_points    > "failing_points.rpt"
report_aborted_points    > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"

########################### Start GUI ############################# 
start_gui
