onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Sky Blue} /Counter_8b_TB/clr
add wave -noupdate -color {Dark Orchid} /Counter_8b_TB/clk
add wave -noupdate -color {Lime Green} /Counter_8b_TB/Q
add wave -noupdate -color Gold /Counter_8b_TB/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {464 ps} 0}
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
WaveRestoreZoom {0 ps} {512 ps}
