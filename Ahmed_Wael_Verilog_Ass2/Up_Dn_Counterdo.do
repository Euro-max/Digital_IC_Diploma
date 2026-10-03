# 1. Create the work library
vlib work

# 2. Compile ONLY the specific Verilog files for this project with coverage enabled 
# (Replace the filenames if you saved them under slightly different names)
vlog Up_Dn_Counter.v Up_Dn_Counter_tb.v +cover 

# 3. Load the simulation with full visibility (+acc) and coverage enabled
vsim -voptargs=+acc work.Up_Dn_Counter_tb -cover -sv_seed random -l sim1.log

# 4. Add signals to the waveform viewer
add wave *

# 5. Run the simulation to completion (until $finish in your testbench)
run -all

# 6. FORCE SAVE the coverage database immediately
coverage save Up_Dn_Counter.ucdb 

# 7. Generate the readable text report from the database
vcover report Up_Dn_Counter.ucdb -details -all -output coverage_Up_Dn_Counter_rpt.txt