vlib work
vlog *.v 
vsim -voptargs=+acc work.RESET_SYNC_TB
do wave.do
run -all
