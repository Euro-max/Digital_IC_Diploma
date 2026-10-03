# 1. Create the work library
vlib work

# 2. Compile the Register File RTL and Testbench IN ORDER
# (+cover=bcestf tracks Code Coverage: branch, condition, expression, statement, toggle, fsm)
vlog RegisterFile.v RegisterFile_tb.v +cover=bcestf

# 3. Load simulation (Targeting the top module 'RegisterFile_tb')
vsim -voptargs=+acc work.RegisterFile_tb -cover -sv_seed random -onfinish stop -l sim1.log

# 4. Add signals to the wave window (wrapped in 'catch' to prevent batch mode crashes)
catch {add wave *}

# 5. Run the simulation until your testbench finishes ($finish is called)
run -all

# 6. FORCE SAVE the coverage database 
coverage save RegisterFile_tb.ucdb 

# 7. Generate the readable text report 
vcover report -details -all -output coverage_RegisterFile_tb_rpt.txt RegisterFile_tb.ucdb