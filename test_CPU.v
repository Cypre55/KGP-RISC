`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:02 11/09/2021
// Design Name:   CPU
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_CPU.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_CPU;

	// Inputs
	reg clk;
	reg rst;
	wire ALU_Zero;
	wire [31:0] reg1;
	wire [31:0] reg0, reg10, reg11, reg14, reg31, inst, OLD_PC, ALU_Result, ALU_In_A, ALU_In_B;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk),
		.rst(rst),
		.reg0(reg0),
		.reg1(reg1),
		.reg10(reg10),
		.reg11(reg11),
		.reg14(reg14),
		.reg31(reg31),
		.OLD_PC(OLD_PC),
		.ALU_In_B(ALU_In_B),
		.ALU_In_A(ALU_In_A),
		.ALU_Zero(ALU_Zero),
		.ALU_Result(ALU_Result),
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		// $monitor("Time: %0t, PC_REG_VALUE: %b", $realtime, uut.PC.program_counter);
		// $monitor("Time: %0t, PC_Out: %b", $realtime, uut.PC_Out);
		// $monitor("Time: %0t, inst: %b", $realtime, uut.inst);
		$monitor("Time: %0t, inst: %b", $realtime, uut.inst);
		#10;
		rst = 0;

		#3000;
		$finish;

	end
	
	
	
	always #5 clk = ~clk;
      
endmodule

