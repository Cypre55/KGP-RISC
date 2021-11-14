`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:40 11/08/2021
// Design Name:   shifter
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_shifter.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shifter;

	// Inputs
	reg [2:0] op;
	reg [31:0] a;
	reg [4:0] sh_amt;

	// Outputs
	wire [31:0] sh_result;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
		.sh_result(sh_result), 
		.op(op), 
		.a(a), 
		.sh_amt(sh_amt)
	);

	initial begin
		// Initialize Inputs
		op = 3'b011;
		a = -54;
		sh_amt = 0;
		#100;
		sh_amt = 5;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Add stimulus here
		op = 3'b100;
		a = -54;
		#100;
		op = 3'b101;
		a = -54;
		#100;
	end
      
endmodule

