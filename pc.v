`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:14 11/09/2021 
// Design Name: 
// Module Name:    pc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
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
