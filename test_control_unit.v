`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// 
// 
//////////////////////////////////////////////////////////////////////////////////

module control_test;

	// Inputs
	reg [5:0] opCode;
	reg [8:0] functCode;

	// Outputs
	wire CondBr;
	wire RegBr;
	wire UncondBr;
	wire MemRead;
	wire MemWrite;
	wire WriteReg;
	wire ALUSrc;
	wire [1:0] WriteSrc;
	wire RegDst;
	wire [1:0] UncondControl;
	wire [1:0] CondControl;
	wire [2:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.CondBr(CondBr), 
		.RegBr(RegBr), 
		.UncondBr(UncondBr), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.WriteReg(WriteReg), 
		.ALUSrc(ALUSrc), 
		.WriteSrc(WriteSrc), 
		.RegDst(RegDst), 
		.UncondControl(UncondControl), 
		.CondControl(CondControl), 
		.ALUOp(ALUOp), 
		.opCode(opCode), 
		.functCode(functCode)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;
		functCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
      opCode = 6'b001000;
		functCode = 8'b001000000;
		// Add stimulus here

	end
      
endmodule

