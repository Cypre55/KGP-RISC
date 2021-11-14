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
module branch_mechanism( zero, carry, negative, immediate, pseudo_add, 
			register, pc, uncondBr, condBr, regBr, out, condControl, uncondControl);  
input zero, carry, negative, uncondBr, condBr, regBr;
input [31:0] immediate, register, pc;
input [25:0] pseudo_add;
input [1:0] uncondControl, condControl;
output [31:0] out;



wire [31:0] condOut, uncondOut;
wire condFinal, condPrefinal, uncondFinal, uncondPrefinal  ;
 

reg [31:0] condAdd, uncondAdd;

multiplexer21 condMux(.a(condAdd),.b(pc),.select(condFinal),.out(condOut));
multiplexer21 uncondMux(.a(uncondAdd),.b(condOut),.select(uncondFinal),.out(uncondOut));
multiplexer21 regMux(.a(register),.b(uncondOut),.select(regBr),.out(out));

always@(pc or immediate)
begin
	condAdd=immediate;
	condAdd=condAdd<<2;
	condAdd=pc+condAdd;
end

always@(pseudo_add or pc) begin
	uncondAdd=pseudo_add;
	uncondAdd=uncondAdd<<2;
	uncondAdd[31]=pc[31];	uncondAdd[30]=pc[30];	uncondAdd[29]=pc[29];	uncondAdd[28]=pc[28];
end

//select line for conditional branch mux
and condAnd(condFinal, condPrefinal, condBr);
or condOr(condPrefinal, bltz, bnz, bz);
and bltzAnd(bltz, negative, !condControl[0], condControl[1]);
and bzAnd(bz, zero, condControl[0], condControl[1]);
and bnzAnd(bnz, !zero, condControl[0], !condControl[1]);


//select line for unconditional branch mux
and uncondAnd(uncondFinal, uncondPrefinal, uncondBr);
or uncondOr(uncondPrefinal, bcy, bncy, blb);
and bncyAnd(bncy,!carry, !uncondControl[0], uncondControl[1]);
and bcyAnd(bcy, carry, uncondControl[0], uncondControl[1]);
and blbAnd(blb, uncondControl[0], !uncondControl[1]);

endmodule
