`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This is the testbench for the Data Memory
// 
// Ensure Data_Memory initiated and loaded correctly
// 
//////////////////////////////////////////////////////////////////////////////////

module test_DataMemory;

	// Inputs
	reg clka;
	reg ena;
	reg wea;
	reg [9:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Data_Memory uut (
		.clka(clka), 
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		ena = 0;
		wea = 0;
		addra = 2;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#20;
		ena = 1;
		#20;
		
		wea = 1;
		ena = 1;
		dina = 32;
        
		// Add stimulus here

	end
      
	always #10 clka = ~clka;
endmodule

