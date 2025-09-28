
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/IC/Final_Project/DFT/dft/$top_module.svf"

###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

# Read Reference Design Verilog Files

read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/SYS_TOP.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_TX_FSM.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_TX_Parity.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_TX_Serializer.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_TX_Top.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_deserializer.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_edge_counter.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_FSM.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_parity_check.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_sampler.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_start_check.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_stop_check.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_RX_Top.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/UART_TOP.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/SYS_CTRL.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ALU.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/RegFile.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/DATA_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/PULSE_GEN.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ASYNC_FIFO_BIT_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ASYNC_FIFO_MEM.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ASYNC_FIFO_RD.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ASYNC_FIFO_WR.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/ASYNC_FIFO_TOP.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/Clk_Divider.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/CLK_GATE.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/RST_SYNC.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/CLKDIV_MUX.v"
read_verilog -container Ref "/home/IC/Final_Project/DFT/RTL/MUX_2X1.v"

# Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design $top_module
set_top $top_module


######################## Implementation Container #########################

# Read Implementation Design Files
read_verilog -container Imp -netlist "/home/IC/Final_Project/DFT/dft/netlists/$top_module.v"

# Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_implementation_design $top_module
set_top $top_module


########################## Don't verify ###########################

# do not verify scan out ports as a compare point 
# As it is existed only after synthesis and not existed in the RTL

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO*
set_dont_verify_points -type port Imp:/WORK/*/SO*


############################# contants #############################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0


########################### matching Compare points ##########################

match

################################# verify #####################################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points    > "reports/passing_points.rpt"
report_failing_points    > "reports/failing_points.rpt"
report_aborted_points    > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
