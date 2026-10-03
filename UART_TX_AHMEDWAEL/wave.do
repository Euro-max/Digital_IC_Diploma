onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP_signals -color Cyan /UART_TOP_TB/clk
add wave -noupdate -expand -group TOP_signals -color Red /UART_TOP_TB/rst
add wave -noupdate -expand -group TOP_signals -color Gray90 /UART_TOP_TB/Busy_tb
add wave -noupdate -expand -group TOP_signals -color {Medium Aquamarine} /UART_TOP_TB/Data_Valid
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/P_DATA
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/TX_out_tb
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/DUT/Ser/count
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/DUT/Ser/ser_data
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/DUT/Ser/ser_done
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/DUT/Ser/ser_en
add wave -noupdate -expand -group TOP_signals /UART_TOP_TB/DUT/Ser/shift_reg
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/I1
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/I2
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/I3
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/IO
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/Op
add wave -noupdate -expand -group MUX_signals /UART_TOP_TB/DUT/mux/sel
add wave -noupdate -expand -group Par_signals /UART_TOP_TB/DUT/par/DATA_VALID
add wave -noupdate -expand -group Par_signals /UART_TOP_TB/DUT/par/P_DATA
add wave -noupdate -expand -group Par_signals /UART_TOP_TB/DUT/par/par_bit
add wave -noupdate -expand -group FSM_signals /UART_TOP_TB/DUT/fsm/Busy
add wave -noupdate -expand -group FSM_signals -radixenum symbolic -radixshowbase 0 /UART_TOP_TB/DUT/fsm/current_state
add wave -noupdate -expand -group FSM_signals /UART_TOP_TB/DUT/fsm/DATA_VALID
add wave -noupdate -expand -group FSM_signals /UART_TOP_TB/DUT/fsm/mux_sel
add wave -noupdate -expand -group FSM_signals -radixenum symbolic /UART_TOP_TB/DUT/fsm/next_state
add wave -noupdate -expand -group FSM_signals /UART_TOP_TB/DUT/fsm/ser_done
add wave -noupdate -expand -group FSM_signals /UART_TOP_TB/DUT/fsm/ser_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59361 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {8874 ps} {118933 ps}
