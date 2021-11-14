`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:16 11/08/2021 
// Design Name: 
// Module Name:    shifter 
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
module shifter(sh_result, op, a, sh_amt);

input signed [31:0] a;
input [2:0] op;
input [4:0] sh_amt;
output reg signed [31:0] sh_result;

always @ (op or a or sh_amt) begin
	if (op == 3'b011) begin
		sh_result <= a << sh_amt;
	end else if (op == 3'b100) begin
		sh_result <= a >> sh_amt;
	end else if (op == 3'b101) begin
		sh_result <= a >>> sh_amt;
		$display("Right Shift Artihmatic");

	end
end

endmodule
