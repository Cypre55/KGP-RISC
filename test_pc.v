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

module pc_test;

	// Inputs
	reg [31:0] inp;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] out, finout;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.inp(finout), 
		.out(out), 
		.clk(clk), 
		.rst(rst)
	);
	
	add4 ad(.inp(out), .out(finout));
	

	initial begin
		// Initialize Inputs
		inp = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst=1; 
		#10 rst=0;
		// Add stimulus here

	end
	
	always
	#10 clk=~clk;
      
endmodule
