onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/clk
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_t0/DataOutput
add wave -noupdate -divider {MUx jump}
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Output
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/inst_shift
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/instruction_bus_wire
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Data0
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Data1
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/MuxForJump/MUX_Output
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ControlUnit/OP
add wave -noupdate -divider PC
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/NewPC
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/ProgramCounter/PCValue
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47 ps} 0}
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
WaveRestoreZoom {30 ps} {74 ps}
