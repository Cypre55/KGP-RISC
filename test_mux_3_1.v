`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:24:50 11/11/2021
// Design Name:   Mux_3_1
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_mux_3_1.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_3_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

