`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:05 11/08/2021 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(op, shift_src, ALUOp, func_code);

input [2:0] ALUOp;
input [7:0] func_code;
output reg [2:0] op;
output reg shift_src;

always @ (ALUOp or func_code) begin
	if (ALUOp == 3'b000) begin 
        if (func_code == 8'b00000001)
            op <= 110;
        else if (func_code == 8'b00000010)
            op <= 111;
        else if (func_code == 8'b00000100) begin
            op <= 011;
            shift_src <= 1;
        end
        else if (func_code == 8'b00001000) begin
            op <= 100;
            shift_src <= 1;
        end
        else if (func_code == 8'b00010000) begin
            op <= 101;
            shift_src <= 1;
        end
        else if (func_code == 8'b01000000)
            op <= 000;
        else if (func_code == 8'b10000000)
            op <= 001;
    end
    else if (ALUOp == 3'b001)
        op <= 010;
    else if (ALUOp == 3'b010) begin
        op <= 011;
        shift_src <= 0;
    end
    else if (ALUOp == 3'b011) begin
        op <= 100;
        shift_src <= 0;
    end
    else if (ALUOp == 3'b100) begin
        op <= 101;
        shift_src <= 0;
    end
    else if (ALUOp == 3'b101)
        op <= 110;
    else if (ALUOp == 3'b110)
        op <= 111;
end


endmodule
