`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This is the testbench for the Instruction Memory
// 
// Ensure Instruction_Memory are initiated and loaded correctly
// 
//////////////////////////////////////////////////////////////////////////////////

module test_instruction_memory;

	// Inputs
	reg clka;
	reg [31:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#15;
		
		addra = 4;
        
		// Add stimulus here

	end
	
	always #5 clka = ~clka;
      
endmodule

