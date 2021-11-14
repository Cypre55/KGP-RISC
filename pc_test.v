`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:02 11/09/2021
// Design Name:   pc
// Module Name:   /home/seemant/Assignment_7/pc_test.v
// Project Name:  Assignment_7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

