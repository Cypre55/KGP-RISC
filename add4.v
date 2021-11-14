`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:30 11/09/2021 
// Design Name: 
// Module Name:    add4 
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
module add4(inp, out);
input [31:0]inp;
output reg [31:0] out;

always@(inp)
	out=inp+4;

endmodule
