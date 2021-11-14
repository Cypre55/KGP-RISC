`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:06 11/11/2021 
// Design Name: 
// Module Name:    Mux21_5bit 
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
