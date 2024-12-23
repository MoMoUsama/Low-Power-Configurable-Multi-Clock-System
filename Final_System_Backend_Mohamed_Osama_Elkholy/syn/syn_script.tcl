
########################### Define Top Module ############################
                                                   
set top_module TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

########################### Formality Setup file ############################
set_svf TOP.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Labs/SYSTEM/std_cells
lappend search_path /home/IC/Labs/SYSTEM/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

analyze -format verilog ALU.v
analyze -format verilog BINARY_TO_GRAY.v
analyze -format verilog CLK_DIV.v
analyze -format verilog CLK_GATE.v
analyze -format verilog Data_Sampling.v
analyze -format verilog DATA_SYNC.v
analyze -format verilog Deserializer.v
analyze -format verilog D_FLOP_SYNC.v
analyze -format verilog Edge_Bit_Counter.v
analyze -format verilog FIFO.v
analyze -format verilog FIFO_RD.v
analyze -format verilog FIFO_WR.v
analyze -format verilog MEM_CNTRL.v
analyze -format verilog MUX.v
analyze -format verilog Parity_Calc.v
analyze -format verilog Parity_Check.v
analyze -format verilog PRESCALE_MUX.v
analyze -format verilog PULSE_GEN.v
analyze -format verilog RegFile.v
analyze -format verilog RX_FSM.v
analyze -format verilog Serializer.v
analyze -format verilog Start_Check.v
analyze -format verilog STOP_CHECK.v
analyze -format verilog SYS_CNTRL.v
analyze -format verilog TOP.v
analyze -format verilog RST_SYNC.v
analyze -format verilog TX_FSM.v
analyze -format verilog UART.v
analyze -format verilog UART_RX.v
analyze -format verilog UART_TX.v

elaborate TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output System_netlist.v
write_file -format ddc -hierarchy -output System_netlist.ddc
write_sdc  -nosplit System_Top.sdc
write_sdf           System_Top.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

#gui_start

#exit
