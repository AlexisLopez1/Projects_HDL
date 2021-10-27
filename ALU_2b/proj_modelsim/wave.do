onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_ALU/select
add wave -noupdate /TB_ALU/c_in
add wave -noupdate /TB_ALU/a
add wave -noupdate /TB_ALU/b
add wave -noupdate /TB_ALU/y
add wave -noupdate /TB_ALU/expected_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156 ps} 0}
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
WaveRestoreZoom {1263 ps} {1513 ps}
