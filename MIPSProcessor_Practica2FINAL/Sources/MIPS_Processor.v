/******************************************************************
* Description
*	This is the top-level of a MIPS processor that can execute the next set of instructions:
*		add
*		addi
*		sub
*		ori
*		or
*		and
*		nor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer architecture class at ITESO.
* Version:
*	1.5
* Author:
*	Andrea Anahi Santana Hernández & Edgar Francisco Medina Rifas
* email:
*	is715468@iteso.mx
* Date:
*	18/11/2019
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 1024,
	parameter PC_INCREMENT = 4
)

(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);
//******************************************************************/
//******************************************************************/
assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// signals to connect modules
wire branch_ne_wire;
wire branch_eq_wire;
wire reg_dst_wire;
wire not_zero_and_brach_ne;
wire zero_and_brach_eq;
wire or_for_branch;
wire alu_src_wire;
wire reg_write_wire;
wire zero_wire;
//Estos no estaban
wire MemRead_wire;
wire MemtoReg_wire;
wire MemWrite_wire;
wire [31:0] ReadDataOutWire;
wire [2:0] aluop_wire;
wire [3:0] alu_operation_wire;
wire [4:0] write_register_wire;
wire [31:0] mux_pc_wire;
wire [31:0] pc_wire;
wire [31:0] instruction_bus_wire;
wire [31:0] read_data_1_wire;
wire [31:0] read_data_2_wire;
wire [31:0] Inmmediate_extend_wire;
wire [31:0] read_data_2_orr_inmmediate_wire;
wire [31:0] alu_result_wire;
wire [31:0] pc_plus_4_wire;
wire [31:0] inmmediate_extended_wire;
wire [31:0] pc_to_branch_wire;
wire [31:0] ReadDataALUResultOut_Wire;
wire [31:0] shiftBranch_wire;
wire [31:0] addOutBranch_wire;
wire [31:0] Mux_BranchResult;
wire jumpWire;
wire [31:0] JumpOut;
wire [27:0] inst_shift;
wire jalWire;
wire [4:0]muxraOut;
wire [31:0] MuxPcOut;
wire jrWire;
wire [4:0] MuxPcJROut;
wire [31:0] MuxPcFinalOut;
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.func(instruction_bus_wire[5:0]),
	.OP(instruction_bus_wire[31:26]),
	.RegDst(reg_dst_wire),
	.BranchEQ(branch_eq_wire),
	.BranchNE(branch_ne_wire),
	.MemRead(MemRead_wire),
	.MemtoReg(MemtoReg_wire),
	.MemWrite(MemWrite_wire),
	.ALUSrc(alu_src_wire),
	.RegWrite(reg_write_wire),
	.ALUOp(aluop_wire),
	.jump(jumpWire),
	.jal(jalWire),
	.jr(jrWire)
);


PC_Register
ProgramCounter
(
	.clk(clk),
	.reset(reset),
	.NewPC(MuxPcFinalOut),
	.PCValue(pc_wire)
);

ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(pc_wire),
	.Instruction(instruction_bus_wire)
);

Adder32bits
PC_Puls_4
(
	.Data0(pc_wire),
	.Data1(PC_INCREMENT),
	.Result(pc_plus_4_wire)
);
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.Selector(reg_dst_wire),
	.MUX_Data0(instruction_bus_wire[20:16]),
	.MUX_Data1(instruction_bus_wire[15:11]),
	.MUX_Output(write_register_wire)

);



RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(reg_write_wire),
	.WriteRegister(muxraOut),
	.ReadRegister1(instruction_bus_wire[25:21]),
	.ReadRegister2(instruction_bus_wire[20:16]),
	.WriteData(MuxPcOut),
	.ReadData1(read_data_1_wire),
	.ReadData2(read_data_2_wire)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(instruction_bus_wire[15:0]),
   .SignExtendOutput(Inmmediate_extend_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(alu_src_wire),
	.MUX_Data0(read_data_2_wire),
	.MUX_Data1(Inmmediate_extend_wire),
	
	.MUX_Output(read_data_2_orr_inmmediate_wire)

);


ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(aluop_wire),
	.ALUFunction(instruction_bus_wire[5:0]),
	.ALUOperation(alu_operation_wire)

);



ALU
ArithmeticLogicUnit 
(
	.ALUOperation(alu_operation_wire),
	.A(read_data_1_wire),
	.B(read_data_2_orr_inmmediate_wire),
	.shamt(instruction_bus_wire[10:6]),
	.Zero(zero_wire),
	.ALUResult(alu_result_wire)
);

DataMemory 
#(	
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(256)
)
RAM
(
	.WriteData(read_data_2_wire),
	.Address(alu_result_wire),
	.MemWrite(MemWrite_wire),
	.MemRead(MemRead_wire),
	.clk(clk),
	.ReadData(ReadDataOutWire)
);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndALUResult
(
	.Selector(MemtoReg_wire),
	.MUX_Data0(alu_result_wire),
	.MUX_Data1(ReadDataOutWire),
	
	.MUX_Output(ReadDataALUResultOut_Wire)

);

assign ALUResultOut = alu_result_wire;
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
ShiftLeft2 
shiftBranch
(   
	.DataInput(Inmmediate_extend_wire),
   .DataOutput(shiftBranch_wire)
);

Adder32bits
Add_ShiftBranch
(
	.Data0(pc_plus_4_wire),
	.Data1(shiftBranch_wire),
	
	.Result(addOutBranch_wire)
);

Multiplexer2to1
#(
	.NBits(32)
)
Mux_AddBranch
(
	.Selector((branch_eq_wire&zero_wire)|(branch_ne_wire&~zero_wire)),
	.MUX_Data0(pc_plus_4_wire),
	.MUX_Data1(addOutBranch_wire),
	
	.MUX_Output(Mux_BranchResult)

);

assign inst_shift = instruction_bus_wire[25:0]<<2;

Multiplexer2to1
#(
	.NBits(32)
)
MuxForJump
(
	.Selector(jumpWire),
	.MUX_Data0(Mux_BranchResult),
	.MUX_Data1({pc_plus_4_wire[31:28] , inst_shift}),
	
	.MUX_Output(JumpOut)

);
//JAL
Multiplexer2to1
#(
	.NBits(5)
)
MuxRa
(
	.Selector(jalWire),
	.MUX_Data0(write_register_wire),
	.MUX_Data1(31),
	.MUX_Output(muxraOut)
);

//MuxPCJAL
Multiplexer2to1
#(
	.NBits(32)
)
MuxPC
(
	.Selector(jalWire),
	.MUX_Data0(ReadDataALUResultOut_Wire),
	.MUX_Data1(pc_plus_4_wire),
	.MUX_Output(MuxPcOut)
);


//MuxPCJR
Multiplexer2to1
#(
	.NBits(32)
)
MuxPCJR
(
	.Selector(jrWire),
	.MUX_Data0(JumpOut),
	.MUX_Data1(read_data_1_wire),
	.MUX_Output(MuxPcFinalOut)
);

endmodule

