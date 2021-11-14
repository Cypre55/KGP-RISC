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
module test_CPU;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk),
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		// $monitor("Time: %0t, PC_REG_VALUE: %b", $realtime, uut.PC.program_counter);
		// $monitor("Time: %0t, PC_Out: %b", $realtime, uut.PC_Out);
		// $monitor("Time: %0t, inst: %b", $realtime, uut.inst);
		$monitor("Time: %0t, inst: %b", $realtime, uut.inst);
		#10;
		rst = 0;

	end
	
	
	
	always #5 clk = ~clk;
      
endmodule

