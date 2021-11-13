onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FSM_TB/clk
add wave -noupdate -color {Green Yellow} /FSM_TB/reset
add wave -noupdate -color Orange /FSM_TB/w
add wave -noupdate -color Yellow /FSM_TB/z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {846 ps}
