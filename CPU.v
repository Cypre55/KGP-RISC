`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:25 11/09/2021 
// Design Name: 
// Module Name:    CPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPU(reg0, reg1, reg10, reg11, ALU_In_A, ALU_In_B, ALU_Zero, ALU_Result, reg14, reg31, OLD_PC, inst, clk, rst);

input clk, rst;
output [31:0] reg0, reg1, reg10, reg11, reg14, reg31;
output [31:0] inst, OLD_PC, ALU_Result, ALU_In_A, ALU_In_B;
output ALU_Zero;


wire CondBr, RegBr, UncondBr,  ALUSrc, RegDst,ShiftSrc;
wire WriteReg, ALU_Neg, ALU_Zero, ALU_Carry, MemRead, MemWrite;
wire [1:0] WriteSrc, UncondControl, CondControl;
wire [2:0] ALUOp, ALU_C_Out;
wire [4:0] WriteReg_In;
wire [31:0] ALU_In_A, OLD_PC, ALU_Result, PC_In;
wire [31:0] SignExtend_Out, PC_Out, Add4_Out, WriteData_In, ReadData_1, ReadData_2, ALU_In_B, DataMemory_Out;


control_unit Control_Unit(CondBr,
                            RegBr,
                            UncondBr,
                            MemRead,
                            MemWrite,
                            WriteReg,
                            ALUSrc,
                            WriteSrc,
                            RegDst,
                            UncondControl,
                            CondControl,
                            ALUOp,
                            inst[31:26],
                            inst[15:8]);
									 
ALU_Control ALUControl (
	.op(ALU_C_Out), 
	.ALUOp(ALUOp), 
	.func_code(inst[15:8]),
	.shift_src(ShiftSrc)
);

ALU AL_Unit (
	.result(ALU_Result), 
	.neg_out(ALU_Neg), 
	.zero_out(ALU_Zero), 
	.carry_out(ALU_Carry), 
	.a(ALU_In_A), 
	.b(ALU_In_B), 
	.sh_amt(inst[20:16]), 
	.op(ALU_C_Out),
	.shift_src(ShiftSrc),
	.clk(clk)
);

multiplexer21 ALUSrcMux1 (
	.a(ReadData_1),
	.b(ReadData_2),
	.select(!MemRead),
	.out(ALU_In_A)
);

multiplexer21 ALUSrcMux2 (
	.a(ReadData_2),
	.b(SignExtend_Out),
	.select(ALUSrc),
	.out(ALU_In_B)
);

Mux21_5bit WriteRegMux (
	.in1(inst[25:21]),
	.in0(5'b11111),
	.sel(RegDst),
	.out(WriteReg_In)
);

Mux_3_1 WriteDataMux (
	.out(WriteData_In), 
	.in00(OLD_PC),
	.in01(DataMemory_Out),
	.in10(ALU_Result), 
	.sel(WriteSrc)
);

register_file RegisterFile (
	.read_reg1(inst[25:21]), 
	.read_reg2(inst[20:16]), 
	.write_reg(WriteReg_In), 
	.write_data(WriteData_In), 
	.read_data1(ReadData_1), 
	.read_data2(ReadData_2), 
	.write(WriteReg), 
	.clk(clk),
	.rst(rst),
	.reg0(reg0),
	.reg1(reg1),
	.reg10(reg10),
	.reg11(reg11),
	.reg14(reg14),
	.reg31(reg31)
);

sign_extend Sign_Extend (
	.out(SignExtend_Out), 
	.in(inst[15:0])
);

branch_mechanism Branch_Unit (
	.zero(ALU_Zero), 
	.carry(ALU_Carry), 
	.negative(ALU_Neg), 
	.immediate(SignExtend_Out), 
	.pseudo_add(inst[25:0]), 
	.register(ReadData_1), 
	.pc(Add4_Out),
	.uncondBr(UncondBr), 
	.condBr(CondBr), 
	.regBr(RegBr), 
	.out(PC_In), 
	.condControl(CondControl), 
	.uncondControl(UncondControl)		
);

pc PC (
	.inp(PC_In), 
	.out(PC_Out), 
	.clk(clk), 
	.rst(rst),
	.old_val(OLD_PC)
);
	
add4 Add4(.inp(PC_Out), .out(Add4_Out));

Instruction_Memory Inst_Memory (
	.clka(clk), 
	.addra(PC_Out), 
	.douta(inst)
);

Data_Memory DataMemory (
	.clka(!clk), 
	.ena(MemRead), 
	.wea(MemWrite), 
	.addra(ALU_Result[9:0]), 
	.dina(ReadData_1), 
	.douta(DataMemory_Out)
);



endmodule
