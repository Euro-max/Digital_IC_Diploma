lappend search_path /mnt/hgfs/Shared_Folder/Ass_Syn_1.0/std_cells
lappend search_path /mnt/hgfs/Shared_Folder/Ass_Syn_1.0/rtl
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set target_library [list $TTLIB]
set link_library [list * $TTLIB]
read_file -format verilog Down_Counter.v
link
write_file -format verilog -output Dn_Counter_netlist_GTECH.v
compile
write_file -format verilog -output Dn_Counter_netlist.v
start_gui
#exit

