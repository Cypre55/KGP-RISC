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
module pc(inp, out, clk, rst, old_val);
input [31:0]inp;
input clk, rst;
output reg [31:0] out;
output [31:0] old_val;

reg [31:0] program_counter;

always@(negedge clk) begin
	if(rst) 
	begin
		out<=0;
		// program_counter<=0;
	end
	if (!rst && inp !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
	// program_counter<=inp;
	out<=inp;
	end
end

always@(posedge clk)
begin
	if(rst) 
	begin
		// out<=0;
		program_counter<=0;
	end
	if (!rst && inp !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
	program_counter<=inp;
	// out<=inp;
	end
end

assign old_val = program_counter;

endmodule
