vlib work
vlog *.v *.sv
vsim -voptargs=+acc work.UART_TOPR_TB
do wave.do
run -all
