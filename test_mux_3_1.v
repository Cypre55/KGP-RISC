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

module test_mux_3_1;

	// Inputs
	reg [31:0] in00;
	reg [31:0] in01;
	reg [31:0] in10;
	reg [1:0] sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Mux_3_1 uut (
		.out(out), 
		.in00(in00), 
		.in01(in01), 
		.in10(in10), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		in00 = 3;
		in01 = 14;
		in10 = 24;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		sel = 1;
		
		#10;
		
		sel = 2;
		
		#10;
		// Add stimulus here

	end
      
endmodule

