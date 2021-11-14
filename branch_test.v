`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:25:42 11/08/2021
// Design Name:   branch_mechanism
// Module Name:   /home/seemant/Assignment_7/branch_test.v
// Project Name:  Assignment_7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_mechanism
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_test;

	// Inputs
	reg zero;
	reg carry;
	reg negative;
	reg [31:0] immediate;
	reg [25:0] pseudo_add;
	reg [31:0] register;
	reg [31:0] pc;
	reg uncondBr;
	reg condBr;
	reg regBr;
	reg [1:0] condControl;
	reg [1:0] uncondControl;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	branch_mechanism uut (
		.zero(zero), 
		.carry(carry), 
		.negative(negative), 
		.immediate(immediate), 
		.pseudo_add(pseudo_add), 
		.register(register), 
		.pc(pc), 
		.uncondBr(uncondBr), 
		.condBr(condBr), 
		.regBr(regBr), 
		.out(out), 
		.condControl(condControl), 
		.uncondControl(uncondControl)
		
	);

	initial begin
		// Initialize Inputs
		zero = 0;
		carry = 0;
		negative = 0;
		immediate = 0;
		pseudo_add = 0;
		register = 0;
		pc = 0;
		uncondBr = 0;
		condBr = 0;
		regBr = 0;
		condControl = 0;
		uncondControl = 0;

		// Wait 100 ns for global reset to finish
		#100;
		regBr=0; uncondBr=0; condBr=1; condControl=2'b01;  zero=0;   pc=32'b11010000000000000000000000000000; immediate=26'b00000100010000100001100101;
		// Add stimulus here

	end
      
endmodule

