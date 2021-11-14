`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:42 11/08/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(result, neg_out, zero_out, carry_out, a, b, sh_amt, op, shift_src, clk);

input [31:0] a;
input [31:0] b;
input [4:0] sh_amt;
input [2:0] op;
input shift_src, clk;
output [31:0] result;
output wire zero_out;
output wire neg_out;
output reg carry_out;

reg zero, neg;
wire carry;
wire [31:0] sh_result, c_add, c_comp;
wire [4:0] sh_in;

Mux21_5bit ShiftSrc(
	.in0(sh_amt),
	.in1(b[4:0]),
	.sel(shift_src),
	.out(sh_in)
);

shifter Shifter (
		.sh_result(sh_result), 
		.op(op), 
		.a(a), 
		.sh_amt(sh_in)
	);
	
	// result, c_out_add, c_out_comp, a, b, sh_result, c_in_add, c_in_comp, op
One_Bit_ALU alu0 (result[0], c_add[0], c_comp[0], a[0], b[0], sh_result[0], 1'b0, 1'b1, op),
			alu1  (result[1], c_add[1], c_comp[1], a[1], b[1], sh_result[1], c_add[0], c_comp[0], op),
			alu2  (result[2], c_add[2], c_comp[2], a[2], b[2], sh_result[2], c_add[1], c_comp[1], op),
			alu3  (result[3], c_add[3], c_comp[3], a[3], b[3], sh_result[3], c_add[2], c_comp[2], op),
			alu4  (result[4], c_add[4], c_comp[4], a[4], b[4], sh_result[4], c_add[3], c_comp[3], op),
			alu5  (result[5], c_add[5], c_comp[5], a[5], b[5], sh_result[5], c_add[4], c_comp[4], op),
			alu6  (result[6], c_add[6], c_comp[6], a[6], b[6], sh_result[6], c_add[5], c_comp[5], op),
			alu7  (result[7], c_add[7], c_comp[7], a[7], b[7], sh_result[7], c_add[6], c_comp[6], op),
			alu8  (result[8], c_add[8], c_comp[8], a[8], b[8], sh_result[8], c_add[7], c_comp[7], op),
			alu9  (result[9], c_add[9], c_comp[9], a[9], b[9], sh_result[9], c_add[8], c_comp[8], op),
			alu10 (result[10], c_add[10], c_comp[10], a[10], b[10], sh_result[10], c_add[9], c_comp[9], op),
			alu11 (result[11], c_add[11], c_comp[11], a[11], b[11], sh_result[11], c_add[10], c_comp[10], op),
			alu12 (result[12], c_add[12], c_comp[12], a[12], b[12], sh_result[12], c_add[11], c_comp[11], op),
			alu13 (result[13], c_add[13], c_comp[13], a[13], b[13], sh_result[13], c_add[12], c_comp[12], op),
			alu14 (result[14], c_add[14], c_comp[14], a[14], b[14], sh_result[14], c_add[13], c_comp[13], op),
			alu15 (result[15], c_add[15], c_comp[15], a[15], b[15], sh_result[15], c_add[14], c_comp[14], op),
			alu16 (result[16], c_add[16], c_comp[16], a[16], b[16], sh_result[16], c_add[15], c_comp[15], op),
			alu17 (result[17], c_add[17], c_comp[17], a[17], b[17], sh_result[17], c_add[16], c_comp[16], op),
			alu18 (result[18], c_add[18], c_comp[18], a[18], b[18], sh_result[18], c_add[17], c_comp[17], op),
			alu19 (result[19], c_add[19], c_comp[19], a[19], b[19], sh_result[19], c_add[18], c_comp[18], op),
			alu20 (result[20], c_add[20], c_comp[20], a[20], b[20], sh_result[20], c_add[19], c_comp[19], op),
			alu21 (result[21], c_add[21], c_comp[21], a[21], b[21], sh_result[21], c_add[20], c_comp[20], op),
			alu22 (result[22], c_add[22], c_comp[22], a[22], b[22], sh_result[22], c_add[21], c_comp[21], op),
			alu23 (result[23], c_add[23], c_comp[23], a[23], b[23], sh_result[23], c_add[22], c_comp[22], op),
			alu24 (result[24], c_add[24], c_comp[24], a[24], b[24], sh_result[24], c_add[23], c_comp[23], op),
			alu25 (result[25], c_add[25], c_comp[25], a[25], b[25], sh_result[25], c_add[24], c_comp[24], op),
			alu26 (result[26], c_add[26], c_comp[26], a[26], b[26], sh_result[26], c_add[25], c_comp[25], op),
			alu27 (result[27], c_add[27], c_comp[27], a[27], b[27], sh_result[27], c_add[26], c_comp[26], op),
			alu28 (result[28], c_add[28], c_comp[28], a[28], b[28], sh_result[28], c_add[27], c_comp[27], op),
			alu29 (result[29], c_add[29], c_comp[29], a[29], b[29], sh_result[29], c_add[28], c_comp[28], op),
			alu30 (result[30], c_add[30], c_comp[30], a[30], b[30], sh_result[30], c_add[29], c_comp[29], op),
			alu31 (result[31], carry    , c_comp[31], a[31], b[31], sh_result[31], c_add[30], c_comp[30], op);
			
always @(a or result) begin
	if (result[31] == 1)
		neg <= 1;
	else
		neg <= 0;
	if (result == 0)
		zero <= 1;
	else
		zero <= 0;
end

// assign carry_out = carry;
assign zero_out = zero;
assign neg_out = neg;

always @(posedge clk) begin
	carry_out <= carry;
 	// zero_out <= zero;
	// neg_out <= neg;
end




endmodule
