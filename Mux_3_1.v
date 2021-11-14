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
module Mux_3_1(out, in00, in01, in10, sel);

input [31:0] in00, in01, in10;
input [1:0] sel;
output reg [31:0] out;

always @(in00 or in01 or in10 or sel) begin
	if (sel == 2'b00)
		out = in00;
	else if (sel == 2'b01)
		out = in01;
	else if (sel == 2'b10)
		out = in10;
end

endmodule
