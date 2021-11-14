`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// The program counter to store the address of the next address to read from the instruction memory
// The output is updated on the negedge of the clock
// The value to be output is first stored in the program_counter register which is updated on the posedge
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
	end
	if (!rst && inp !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
	out<=inp;
	end
end

always@(posedge clk)
begin
	if(rst) 
	begin
		program_counter<=0;
	end
	if (!rst && inp !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
	program_counter<=inp;
	end
end

assign old_val = program_counter;

endmodule
