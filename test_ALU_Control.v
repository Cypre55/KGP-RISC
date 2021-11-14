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

module test_ALU_Control;

	// Inputs
	reg [2:0] ALUOp;
	reg [7:0] func_code;

	// Outputs
	wire [2:0] op;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.op(op), 
		.ALUOp(ALUOp), 
		.func_code(func_code)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		func_code = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		ALUOp = 0;
		func_code = 2;
		
		#10;
		
		ALUOp = 0;
		func_code = 4;
		
		#10;
		
		ALUOp = 0;
		func_code = 8;
		
		#10;
		
		ALUOp = 0;
		func_code = 16;
		
		#10;
		
		ALUOp = 0;
		func_code = 64;
		
		#10;
		
		ALUOp = 0;
		func_code = 128;
		
		#10;
		
		ALUOp = 1;
		
		#10;
		
		ALUOp = 2;
		
		#10;
		
		ALUOp = 3;
		
		#10;
		
		ALUOp = 4;
		
		#10;
		
		ALUOp = 5;
		
		#10;
		
		ALUOp = 6;
		
        
		// Add stimulus here

	end
      
endmodule

