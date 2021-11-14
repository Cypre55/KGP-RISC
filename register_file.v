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
module register_file(read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2, write, clk, rst);
input [4:0] read_reg1, read_reg2, write_reg;
input [31:0] write_data;
input write, clk, rst;
output reg [31:0]read_data1, read_data2;

reg [31:0] registers[31:0];

always@(posedge clk) begin
if(rst) 
	begin
		registers[0]=32'b0;
		registers[1]=32'b0;
		registers[2]=32'b0;
		registers[3]=32'b0;
		registers[3]=32'b0;
		registers[4]=32'b0;
		registers[5]=32'b0;
		registers[6]=32'b0;
		registers[7]=32'b0;
		registers[8]=32'b0;
		registers[9]=32'b0;
		registers[10]=32'b0;
		registers[11]=32'b0;
		registers[12]=32'b0;
		registers[13]=32'b0;
		registers[14]=32'b0;
		registers[15]=32'b0;
		registers[16]=32'b0;
		registers[17]=32'b0;
		registers[18]=32'b0;
		registers[19]=32'b0;
		registers[20]=32'b0;
		registers[21]=32'b0;
		registers[22]=32'b0;
		registers[23]=32'b0;
		registers[24]=32'b0;
		registers[25]=32'b0;
		registers[26]=32'b0;
		registers[27]=32'b0;
		registers[28]=32'b0;
		registers[29]=32'b0;
		registers[30]=32'b0;
		registers[31]=32'b0;
	end
	if(!rst && write)
	registers[write_reg]=write_data;
end

always@(registers[read_reg1] or registers[read_reg2])
begin
	read_data1=registers[read_reg1];
	read_data2=registers[read_reg2];
end

endmodule
