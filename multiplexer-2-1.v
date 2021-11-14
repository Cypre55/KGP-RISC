`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:51 11/08/2021 
// Design Name: 
// Module Name:    multiplexer-2-1 
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
module multiplexer21(a,b,select,out);
input [31:0]a,b;
input  select;
output reg [31:0]out;

always@(*) begin
	if(select) out=a;
	else out =b;
	
end

endmodule
