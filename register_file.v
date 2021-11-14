`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:39 11/09/2021 
// Design Name: 
// Module Name:    register_file 
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
module register_file(read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2, write, clk, rst, 
reg0, reg1, reg10, reg11, reg14, reg31);
input [4:0] read_reg1, read_reg2, write_reg;
input [31:0] write_data;
input write, clk, rst;
output reg [31:0]read_data1, read_data2;
output [31:0] reg0, reg1, reg10, reg11, reg14, reg31;

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

assign reg0 = registers[0];
assign reg1 = registers[1];
assign reg10 = registers[10];
assign reg11 = registers[11];
assign reg14 = registers[14];
assign reg31 = registers[31];

endmodule
