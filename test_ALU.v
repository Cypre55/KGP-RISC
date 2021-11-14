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

module test_ALU;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [4:0] sh_amt;
	reg [2:0] op;
	reg shift_src, clk;

	// Outputs
	wire [31:0] result;
	wire neg;
	wire zero;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.result(result), 
		.neg_out(neg), 
		.zero_out(zero), 
		.carry_out(carry), 
		.a(a), 
		.b(b), 
		.sh_amt(sh_amt),
		.shift_src(shift_src),
		.clk(clk),
		.op(op)
	);

	initial begin
		// Initialize Inputs
		a = -54;
		b = 54;
		sh_amt = 5;
		op = 0;
		shift_src = 1;

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
	
	always #10 clk = ~clk;
      
endmodule

