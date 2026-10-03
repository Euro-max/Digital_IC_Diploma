onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DATA_SYNC_TB/CLK
add wave -noupdate -color {Orange Red} /DATA_SYNC_TB/RST
add wave -noupdate /DATA_SYNC_TB/bus_enable
add wave -noupdate /DATA_SYNC_TB/UNSYNC_BUS
add wave -noupdate -color {Spring Green} /DATA_SYNC_TB/sync_bus
add wave -noupdate /DATA_SYNC_TB/enable_pulse
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26360 ps} 0}
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
WaveRestoreZoom {0 ps} {126 ns}
