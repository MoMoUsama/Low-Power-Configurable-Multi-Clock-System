
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Labs/Lab_Formal_3/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/Lab_Formal_3/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/Lab_Formal_3/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File
set_svf "/home/IC/Labs/SYSTEM/syn/TOP.svf"

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/ALU.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/BINARY_TO_GRAY.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/CLK_DIV.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/CLK_GATE.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Data_Sampling.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/DATA_SYNC.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Deserializer.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/D_FLOP_SYNC.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Edge_Bit_Counter.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/FIFO.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/FIFO_RD.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/FIFO_WR.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/MEM_CNTRL.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/MUX.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Parity_Calc.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Parity_Check.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/PRESCALE_MUX.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/PULSE_GEN.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/RegFile.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/RX_FSM.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Serializer.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/Start_Check.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/STOP_CHECK.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/SYS_CNTRL.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/TOP.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/RST_SYNC.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/TX_FSM.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/UART.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/UART_RX.v"
read_verilog -container r "/home/IC/Labs/SYSTEM/rtl/UART_TX.v"




# Read Reference technology libraries
read_db -container r [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design TOP
set_top TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -container i -netlist "/home/IC/Labs/SYSTEM/syn/System_netlist.v"

# Read Implementation technology libraries
read_db -container i [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design
set_implementation_design TOP
set_top TOP


###################################################################
#################### Implementation Container #####################
###################################################################

########################## Don't verify ###########################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in

#scan_out

############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode

#scan_enable


###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"

########################### Start GUI ############################# 
start_gui

