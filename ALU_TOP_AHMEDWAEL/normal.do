# 1. Create the work library
vlib work

# 2. Compile specific Verilog files with coverage enabled 
# (You can use +cover=sbcet to specify Statement, Branch, Condition, Expression, and Toggle coverage)
vlog Arth.v CMP.v Shift.v Decoder.v Logic.v ALU_top.v TB.v +cover 

# 3. Load the simulation with full visibility (+acc) and coverage enabled
vsim -voptargs=+acc work.TB -cover -sv_seed random -l sim1.log

# 4. Add signals to the waveform viewer
add wave *

# 5. Run the simulation to completion (until $finish in your testbench)
run -all

# 6. FORCE SAVE the coverage database immediately (removed -onexit)
coverage save TB.ucdb 

# 7. Generate the readable text report from the database
vcover report TB.ucdb -details -annotate -all -output coverage_ALU_rpt.txt

# Optional: Keep the simulation open to view the waves, or uncomment below to close it automatically.
# quit -sim