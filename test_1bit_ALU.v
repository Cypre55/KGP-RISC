`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:44 11/08/2021
// Design Name:   One_Bit_ALU
// Module Name:   /home/chaoticsaint/Desktop/Academics/5th Semester/COA Lab/Project/Verilog/test_1bit_ALU.v
// Project Name:  Verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: One_Bit_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_1bit_ALU;

	// Inputs
	reg a;
	reg b;
	reg sh_result;
	reg c_in_add;
	reg c_in_comp;
	reg [2:0] op;

	// Outputs
	wire result;
	wire c_out_add;
	wire c_out_comp;

	// Instantiate the Unit Under Test (UUT)
	One_Bit_ALU uut (
		.result(result), 
		.c_out_add(c_out_add), 
		.c_out_comp(c_out_comp), 
		.a(a), 
		.b(b), 
		.sh_result(sh_result), 
		.c_in_add(c_in_add), 
		.c_in_comp(c_in_comp), 
		.op(op)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 1;
		sh_result = 1;
		c_in_add = 0;
		c_in_comp = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		op = 1;
        
		#100; 
		op = 2;
		
		#100;
		op = 3;
		
		#100;
		op = 4;
		
		#100;
		op = 5;
		
		#100;
		op = 6;
		
		#100;
		a = 1;
		#100;
		c_in_add = 1;
		
		
	end
      
endmodule

