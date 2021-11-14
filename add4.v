`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// The following is the module to increment the value of Program counter by 4 in every cycle.
// 
//////////////////////////////////////////////////////////////////////////////////
module add4(inp, out);
input [31:0]inp;
output reg [31:0] out;

always@(inp)
	out=inp+4;

endmodule
