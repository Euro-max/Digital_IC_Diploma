# 1. Create the work library
vlib work

# 2. Compile with explicit coverage types enabled 
# (b=branch, c=condition, e=expression, s=statement, t=toggle, f=fsm)
vlog ALU_16B.v ALU_16B_tb.v +cover=bcestf

# 3. Load simulation with visibility, coverage, and override $finish behavior
vsim -voptargs=+acc work.ALU_16B_tb -cover -sv_seed random -onfinish stop -l sim1.log

# 4. Add signals to the wave window (wrapped in 'catch' to prevent batch mode crashes)
catch {add wave *}

# 5. Run the simulation until your testbench finishes
run -all

# 6. FORCE SAVE the coverage database (now perfectly reachable!)
coverage save ALU_16B.ucdb 

# 7. Generate the readable text report (Note the corrected filename placement)
vcover report -details -all -output coverage_ALU_16B_rpt.txt ALU_16B.ucdb