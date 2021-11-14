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
module Mux21_5bit(out, in0, in1, sel);

input [4:0] in0, in1;
input sel;
output reg [4:0] out;

always @(in0 or in1 or sel) begin
	if (sel == 1'b0)
		out = in0;
	else if (sel == 1'b1)
		out = in1;
end

endmodule
