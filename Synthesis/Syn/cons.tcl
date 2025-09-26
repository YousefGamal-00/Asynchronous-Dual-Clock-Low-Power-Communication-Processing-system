# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
# ============================================================
# 1. Master Clocks
# ============================================================

# Reference Clock
set REF_CLK_NAME        REF_CLK
set REF_CLK_PER         20
set REF_CLK_SETUP_SKEW  0.2
set REF_CLK_HOLD_SKEW   0.1
set REF_CLK_RISE        0.05
set REF_CLK_FALL        0.05
set REF_CLK_LAT         0

create_clock  -name     $REF_CLK_NAME                  \
              -period   $REF_CLK_PER                   \
              -waveform "0 [expr $REF_CLK_PER/2]"      \
              [get_ports REF_CLK]

set_clock_uncertainty  -setup  $REF_CLK_SETUP_SKEW     [get_clocks $REF_CLK_NAME]
set_clock_uncertainty  -hold   $REF_CLK_HOLD_SKEW      [get_clocks $REF_CLK_NAME]
set_clock_transition   -rise   $REF_CLK_RISE           [get_clocks $REF_CLK_NAME]
set_clock_transition   -fall   $REF_CLK_FALL           [get_clocks $REF_CLK_NAME]
set_clock_latency              $REF_CLK_LAT            [get_clocks $REF_CLK_NAME]


# UART Clock
set UART_CLK_NAME       UART_CLK
set UART_CLK_PER        271.2967987
set UART_CLK_SETUP_SKEW 0.2
set UART_CLK_HOLD_SKEW  0.1
set UART_CLK_RISE       0.05
set UART_CLK_FALL       0.05
set UART_CLK_LAT        0

create_clock  -name     $UART_CLK_NAME                 \
              -period   $UART_CLK_PER                  \
              -waveform "0 [expr $UART_CLK_PER/2]"     \
              [get_ports UART_CLK]

set_clock_uncertainty  -setup  $UART_CLK_SETUP_SKEW    [get_clocks $UART_CLK_NAME]
set_clock_uncertainty  -hold   $UART_CLK_HOLD_SKEW     [get_clocks $UART_CLK_NAME]
set_clock_transition   -rise   $UART_CLK_RISE          [get_clocks $UART_CLK_NAME]
set_clock_transition   -fall   $UART_CLK_FALL          [get_clocks $UART_CLK_NAME]
set_clock_latency              $UART_CLK_LAT           [get_clocks $UART_CLK_NAME]


# ============================================================
# 2. Generated Clocks
# ============================================================

# ALU Clock (from REF_CLK)
create_generated_clock  -name          ALU_CLK             \
                        -master_clock  $REF_CLK_NAME       \
                        -source        [get_ports REF_CLK] \
                        -divide_by     1                   \
                        [get_ports U0_CLK_GATE/GATED_CLK]

set_clock_uncertainty  -setup  $REF_CLK_SETUP_SKEW         [get_clocks ALU_CLK]
set_clock_uncertainty  -hold   $REF_CLK_HOLD_SKEW          [get_clocks ALU_CLK]


# RX Clock (from UART_CLK)
create_generated_clock  -name          RX_CLK                  \
                        -master_clock  $UART_CLK_NAME          \
                        -source        [get_ports UART_CLK]    \
                        -divide_by     1                       \
                        [get_ports U1_ClkDiv/o_div_clk]

set_clock_uncertainty  -setup  $UART_CLK_SETUP_SKEW            [get_clocks RX_CLK]
set_clock_uncertainty  -hold   $UART_CLK_HOLD_SKEW             [get_clocks RX_CLK]


# TX Clock (from UART_CLK)
create_generated_clock  -name          TX_CLK                  \
                        -master_clock  $UART_CLK_NAME          \
                        -source        [get_ports UART_CLK]    \
                        -divide_by     32                      \
                        [get_ports U0_ClkDiv/o_div_clk]

set_clock_uncertainty  -setup  $UART_CLK_SETUP_SKEW            [get_clocks TX_CLK]
set_clock_uncertainty  -hold   $UART_CLK_HOLD_SKEW             [get_clocks TX_CLK]


# ============================================================
# 3. set_dont_touch_network
# ============================================================

set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK RX_CLK TX_CLK}]
# set_dont_touch_network [get_ports RST_N]

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################

# Define asynchronous relationship between REF/ALU domain and UART/RX/TX domain
set_clock_groups -asynchronous                         \
    -group [get_clocks "$REF_CLK_NAME ALU_CLK"]        \
    -group [get_clocks "$UART_CLK_NAME RX_CLK TX_CLK"]    


####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set UART_TX_CLK_PER [expr $UART_CLK_PER * 32]
set UART_RX_CLK_PER 271.2967987

set IN_TX_delay  [expr 0.2*$UART_TX_CLK_PER]
set OUT_TX_delay [expr 0.2*$UART_TX_CLK_PER]

set IN_RX_delay  [expr 0.2*$UART_RX_CLK_PER]
set OUT_RX_delay [expr 0.2*$UART_RX_CLK_PER]

#Constrain Input Paths
set_input_delay $IN_RX_delay -clock RX_CLK   [get_port UART_RX_IN]

#Constrain Output Paths
set_output_delay $OUT_TX_delay -clock TX_CLK [get_port UART_TX_O]
set_output_delay $OUT_RX_delay -clock RX_CLK [get_port parity_error]
set_output_delay $OUT_RX_delay -clock RX_CLK [get_port framing_error]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_port UART_TX_O]
set_load 0.1 [get_port parity_error]
set_load 0.1 [get_port framing_error]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min         "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
			    -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
			    -max         "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

####################################################################################
           #########################################################
                  #### Section 8 : multicycle path ####
           #########################################################
####################################################################################
