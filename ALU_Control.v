`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This module receives the ALUOp from the Control Unit and the Function Code from the
// instruction. It produces the Operation the ALU has to perform as well as the ShiftSrc
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
