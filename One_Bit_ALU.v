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
module One_Bit_ALU(result, c_out_add, c_out_comp, a, b, sh_result, c_in_add, c_in_comp, op);

input a;
input b;
input sh_result;
input c_in_add;
input c_in_comp;
input [2:0] op;
output reg result;
output reg c_out_add;
output reg c_out_comp;

always @ (a or b or sh_result or c_in_add or c_in_comp or op) begin
	if (op == 3'b000) begin
		result <= a & b;
	end else if (op == 3'b001) begin
		result <= a ^ b;
	end else if (op == 3'b010) begin
		result <= a;
	end else if (op == 3'b011) begin
		result <= sh_result;
	end else if (op == 3'b100) begin
		result <= sh_result;
	end else if (op == 3'b101) begin
		result <= sh_result;	
	end else if (op == 3'b110) begin
		result <= a ^ b ^ c_in_add;
		c_out_add <= a&b | (a^b) & c_in_add;
	end else if (op == 3'b111) begin
		result <= ~b ^ c_in_comp;
		c_out_comp <= ~b & c_in_comp; 
	end
end



endmodule
