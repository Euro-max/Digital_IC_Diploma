# 1. Create the work library
vlib work

# 2. Compile ONLY the specific Verilog files for this project with coverage enabled 
# (Replace the filenames if you saved them under slightly different names)
vlog CRC.v CRC_TB.v +cover 

# 3. Load the simulation with full visibility (+acc) and coverage enabled
vsim -voptargs=+acc work.CRC_TB -cover -sv_seed random -l sim1.log

# 4. Add signals to the waveform viewer
add wave *

# 5. Run the simulation to completion (until $finish in your testbench)
run -all

# 6. FORCE SAVE the coverage database immediately
coverage save CRC.ucdb 

# 7. Generate the readable text report from the database
vcover report CRC.ucdb -details -all -output coverage_CRC_rpt.txt