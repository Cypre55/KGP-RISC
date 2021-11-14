`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment 7
//
//Group No.42
//Members: 	Seemant Guruprasad Achari 	19CS10055
//			Chappidi Yoga Satwik 		19CS30013
// 
// This is the testbench for the Register File
// 
//////////////////////////////////////////////////////////////////////////////////

module registers_test;

	// Inputs
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg [4:0] write_reg;
	reg [31:0] write_data;
	reg write;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data1(read_data1), 
		.read_data2(read_data2), 
		.write(write), 
		.clk(clk),
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		read_reg1 = 0;
		read_reg2 = 0;
		write_reg = 0;
		write_data = 0;
		write = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		#10 clk = ~clk;
		#10 clk = ~clk;
      #10 write=1; read_reg1=2; read_reg2=3; write_reg=3; write_data=2828;
		
		// Add stimulus here
	end
	
	always
	#10 clk=~clk;
      
endmodule

