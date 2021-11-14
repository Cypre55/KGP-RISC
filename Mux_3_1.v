`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:05 11/11/2021 
// Design Name: 
// Module Name:    Mux_3_1 
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
