onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate /MIPS_Processor_TB/PortOut
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate -divider {Torre A}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[28]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[24]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[20]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[16]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[12]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[8]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[4]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[0]}
add wave -noupdate -divider {Torre B}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[60]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[56]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[52]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[48]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[44]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[40]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[36]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[32]}
add wave -noupdate -divider {Torre C}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[92]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[88]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[84]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[80]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[76]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[72]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[68]}
add wave -noupdate {/MIPS_Processor_TB/DUV/RAM/ram[64]}
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
WaveRestoreZoom {8882 ps} {9882 ps}
