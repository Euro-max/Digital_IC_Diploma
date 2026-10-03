vlib work
vlog *.v 
vsim -voptargs=+acc work.DATA_SYNC_TB
do wave.do
run -all
