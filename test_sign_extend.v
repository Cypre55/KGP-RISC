`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This is the testbench for the Sign Extend unit
// 
//////////////////////////////////////////////////////////////////////////////////

module test_sign_extend;

	// Inputs
	reg [15:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.out(out), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		in = 16'b1001001101101110;

		// Wait 100 ns for global reset to finish
		#100;
      
		in = 16'b0010110100010101;
		
		#100;
		// Add stimulus here

	end
      
endmodule

