onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /TB_mux2x16/Sel
add wave -noupdate /TB_mux2x16/I0
add wave -noupdate /TB_mux2x16/I1
add wave -noupdate /TB_mux2x16/I2
add wave -noupdate /TB_mux2x16/I3
add wave -noupdate /TB_mux2x16/s
add wave -noupdate -color Gold /TB_mux2x16/i
add wave -noupdate /TB_mux2x16/j
add wave -noupdate /TB_mux2x16/k
add wave -noupdate /TB_mux2x16/l
add wave -noupdate /TB_mux2x16/m
add wave -noupdate /TB_mux2x16/s_gold
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {2620490 ps} {2621490 ps}
