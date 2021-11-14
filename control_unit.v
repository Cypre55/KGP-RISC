`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:28 11/08/2021 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(CondBr,
RegBr,
UncondBr,
MemRead,
MemWrite,
WriteReg,
ALUSrc,
WriteSrc,
RegDst,
UncondControl,
CondControl,
ALUOp,
opCode,
functCode
);
input [5:0] opCode;
input [7:0] functCode;
output reg CondBr, RegBr,UncondBr, MemRead, MemWrite, WriteReg, ALUSrc, RegDst;
output reg [1:0] WriteSrc, UncondControl, CondControl;
output reg [2:0] ALUOp;

always@(opCode or functCode) begin
	//condBr
	if(opCode==6'b000110 || opCode==6'b000111 || opCode==6'b001000)
	CondBr=1'b1;
	else CondBr=1'b0;
	
	//uncondBr
	if(opCode==6'b100101 || opCode==6'b100110 || opCode==6'b100111 || opCode==6'b101000)
	UncondBr=1'b1;
	else UncondBr=1'b0;
	
	//RegBr
	if(opCode==6'b000000 && functCode==8'b00100000)
	RegBr=1'b1;
	else RegBr=1'b0;
	
	//MemWrite
	if(opCode==6'b100001)
	MemWrite=1'b1;
	else MemWrite=1'b0;
	
	//MemRead
	if(opCode==6'b100000 || opCode==6'b100001)
	MemRead=1'b1;
	else MemRead=1'b0;
	
	//WriteReg 
	if(opCode==6'b000000)
	begin 
		if(functCode==8'b00100000 || functCode==8'b00000000)
		WriteReg=1'b0;
		else WriteReg=1'b1;
	end
	else if(opCode==6'b100000)
	WriteReg=1'b1;
	else if(opCode==6'b000001)
	WriteReg=1'b1;
	else if(opCode==6'b000010)
	WriteReg=1'b1;
	else if(opCode==6'b000011)
	WriteReg=1'b1;
	else if(opCode==6'b100110)
	WriteReg=1'b1;
	else if(opCode==6'b000100)
	WriteReg=1'b1;
	else if(opCode==6'b000101)
	WriteReg=1'b1;
	else WriteReg=1'b0;
	
	//ALUSrc
	if(opCode==6'b000000)
	ALUSrc=1'b1;
	else ALUSrc=1'b0;
	
	//RegDst
	if(opCode==6'b100110)
	RegDst=1'b0;
	else RegDst=1'b1;
	
	//WriteSrc
	if(opCode==6'b000000)
	begin
		WriteSrc=2'b10;
	end
	else if(opCode==6'b100110)
	WriteSrc=2'b00;
	else if(opCode==6'b100000)
	WriteSrc=2'b01;
	else WriteSrc=2'b10;
	
	//UncondControl
	if(opCode==6'b100101 || opCode==6'b100110)
	UncondControl=2'b01;
	else if(opCode==6'b100111)
	UncondControl=2'b11;
	else UncondControl=2'b10;
	
	//CondControl
	if(opCode==6'b000110)
	CondControl=2'b10;
	else if(opCode==6'b000111)
	CondControl=2'b11;
	else CondControl=2'b01;
	
	
	//ALUOp
	if(opCode==6'b000000)
	ALUOp=3'b000;
	else if(opCode==6'b100000 || opCode==6'b100001)
	ALUOp=3'b101;
	else if(opCode==6'b000001)
	ALUOp=3'b101;
	else if(opCode==6'b000010)
	ALUOp=3'b110;
	else if(opCode==6'b000011)
	ALUOp=3'b010;
	else if(opCode==6'b000100)
	ALUOp=3'b011;
	else if(opCode==6'b000101)
	ALUOp=3'b100;
	else ALUOp=3'b001;
		
end

endmodule
