`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// 32-bit 2-1 multiplexer
// 
// 
//////////////////////////////////////////////////////////////////////////////////
module multiplexer21(a,b,select,out);
input [31:0]a,b;
input  select;
output reg [31:0]out;

always@(*) begin
	if(select) out=a;
	else out =b;
	
end

endmodule
