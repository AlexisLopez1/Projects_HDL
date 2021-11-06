onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /R9_TB/clk
add wave -noupdate -color {Medium Slate Blue} /R9_TB/clr
add wave -noupdate -color {Medium Slate Blue} /R9_TB/load
add wave -noupdate /R9_TB/clk_enable
add wave -noupdate -color Coral /R9_TB/load_s
add wave -noupdate -color Coral /R9_TB/clr_s
add wave -noupdate -color Yellow /R9_TB/data
add wave -noupdate -color Yellow /R9_TB/d
add wave -noupdate -color Aquamarine /R9_TB/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {387 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 132
configure wave -valuecolwidth 102
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
WaveRestoreZoom {0 ps} {507 ps}
