onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Steel Blue} /UART_TOPR_TB/clk
add wave -noupdate -color {Orange Red} /UART_TOPR_TB/rst
add wave -noupdate /UART_TOPR_TB/DUT/u_RX_FSM/current_state
add wave -noupdate -color {Spring Green} /UART_TOPR_TB/DUT/u_RX_FSM/next_state
add wave -noupdate /UART_TOPR_TB/DUT/u_RX_FSM/RX_IN
add wave -noupdate /UART_TOPR_TB/DUT/u_RX_FSM/bit_cnt
add wave -noupdate -color Yellow /UART_TOPR_TB/DUT/u_RX_FSM/edge_cnt
add wave -noupdate /UART_TOPR_TB/DUT/u_EDGE_COUNTER/bit_sig
add wave -noupdate -color Goldenrod /UART_TOPR_TB/DUT/u_EDGE_COUNTER/done
add wave -noupdate -expand -group {Error Signals} /UART_TOPR_TB/DUT/u_RX_FSM/par_err
add wave -noupdate -expand -group {Error Signals} /UART_TOPR_TB/DUT/u_RX_FSM/stp_err
add wave -noupdate -expand -group {Error Signals} /UART_TOPR_TB/DUT/u_RX_FSM/strt_glitch
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/dat_samp_en
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/deser_en
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/enable
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/par_chk_en
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/stp_chk_en
add wave -noupdate -expand -group {FSM Output Signals} /UART_TOPR_TB/DUT/u_RX_FSM/strt_chk_en
add wave -noupdate -expand -group {FSM Output Signals} -color White /UART_TOPR_TB/DUT/u_RX_FSM/data_valid
add wave -noupdate /UART_TOPR_TB/DUT/u_DESERIALIZER/SAMPLED_BIT
add wave -noupdate -color Aquamarine /UART_TOPR_TB/P_DATA_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23329005 ps} 0}
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
WaveRestoreZoom {0 ps} {156205568 ps}
