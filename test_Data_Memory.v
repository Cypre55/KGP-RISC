`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:56:18 11/11/2021
// Design Name:   Data_Memory
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_DataMemory.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

