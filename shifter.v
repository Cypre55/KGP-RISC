`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This module performs Shift Left Logical, Shift Right Logical
// Shift Right Arithmatic.
// 
// It is a submodule of the ALU.
// 
//////////////////////////////////////////////////////////////////////////////////
module shifter(sh_result, op, a, sh_amt);

input signed [31:0] a;
input [2:0] op;
input [4:0] sh_amt;
output reg signed [31:0] sh_result;

always @ (op or a or sh_amt) begin
	if (op == 3'b011) begin
		sh_result <= a << sh_amt;
	end else if (op == 3'b100) begin
		sh_result <= a >> sh_amt;
	end else if (op == 3'b101) begin
		sh_result <= a >>> sh_amt;
	end
end

endmodule
