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
module sign_extend(out, in);

input [15:0] in;
output reg [31:0] out;

always @(in) begin
	out[31:0] <= { {16{in[15]}}, in[15:0] };
end


endmodule
