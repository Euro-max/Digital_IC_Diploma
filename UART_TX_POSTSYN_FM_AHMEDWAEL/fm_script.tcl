
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/ICer/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"
###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File
set_svf /home/ICer/Shared_Folder/UART_TX/syn/UART_TX.svf

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container Ref /home/ICer/Shared_Folder/UART_TX/rtl/*.v

# Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design UART_TOP_TX
set_top UART_TOP_TX


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -container Imp /home/ICer/Shared_Folder/UART_TX/syn/UART_TOP_TX_netlist.v

# Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]


# set the top Implementation Design
set_implementation_design UART_TOP_TX
set_top UART_TOP_TX


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


start_gui



