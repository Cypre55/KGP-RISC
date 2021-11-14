`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:18 11/08/2021
// Design Name:   control_unit
// Module Name:   /home/seemant/Assignment_7/control_test.v
// Project Name:  Assignment_7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

