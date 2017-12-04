`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:40 11/26/2017 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 
	 /*input clk,
    input reset,
    input [31:0] instr,
    input [31:0] ReadData,
    output [31:0] PC,
    output [31:0] ALUout,
    output [31:0] MemData,
    output MemWr*/
	 
	 wire [31:0] ReadData, instr;
	 wire [31:0] PC, MemData, ALUout;
	 wire MemWr;
	 
	process process(clk, reset, instr, ReadData, PC, ALUout, MemData, MemWr);
	
	imem imem(PC, instr);
	dmem dmem(clk, reset, MemWr, ALUout, PC, MemData, ReadData);
	
endmodule
