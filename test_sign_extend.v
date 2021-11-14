`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:15:25 11/11/2021
// Design Name:   sign_extend
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_sign_extend.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

