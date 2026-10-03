vlib work
vlog *.v *.sv
vsim -voptargs=+acc work.UART_TOP_TB
do wave.do
run -all
