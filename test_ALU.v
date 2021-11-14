`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:37:21 11/08/2021
// Design Name:   ALU
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_ALU.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ALU;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [4:0] sh_amt;
	reg [2:0] op;

	// Outputs
	wire [31:0] result;
	wire neg;
	wire zero;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.result(result), 
		.neg(neg), 
		.zero(zero), 
		.carry(carry), 
		.a(a), 
		.b(b), 
		.sh_amt(sh_amt), 
		.op(op)
	);

	initial begin
		// Initialize Inputs
		a = -54;
		b = 54;
		sh_amt = 5;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		op = 1;
		
		#100;
		
		op = 2;
		
		#100;
		
		op = 3;
      
		#100;
		
		op = 4;
		
		#100;
		
		op = 5;
		
		#100;
		
		op = 6;
		
		#100;
		
		op = 7;
		// Add stimulus here

	end
      
endmodule

