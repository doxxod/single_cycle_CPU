`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:50 11/26/2017 
// Design Name: 
// Module Name:    Process 
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
module process(
    input clk,
    input reset,
    input [31:0] instr,
	 input [31:0] ReadData,
    output [31:0] PC,
    output [31:0] ALUout,
    output [31:0] MemData,
    output MemWr
    );
	 
	wire [1:0] RegDst, PCSrc;
	wire ALUSrc, ALUSrc1;
	wire [1:0] MemtoReg;
	wire RegWr;
	wire nPC_sel;
	wire [1:0] EXTOp;
	wire sb, lh;
	wire [2:0] ALUctr;
	
	 /*input clk,
    input reset,
	 input [31:0] ReadData,//////////
    input [1:0] RegDst,
    input [1:0] PCSrc,
    input ALUSrc,
    input ALUSrc1,
    input [1:0] MemtoReg,
    input RegWr,
    input nPC_sel,
    input [1:0] EXTOp,
    input [2:0] ALUctr,
    input [31:0] instr,
	 output [31:0] PC,
    output [31:0] MemData, // MemData = RD2
    output [31:0] ALUout*/
	 
	 /*input [5:0] opcode,
    input [5:0] funct,
    output [1:0] RegDst,
    output [1:0] PCSrc,
    output ALUSrc,
    output ALUSrc1,
    output [1:0] MemtoReg,
    output RegWr,
    output MemWr,
    output nPC_sel,
    output [1:0] EXTOp,
    output [2:0] ALUctr*/
	
	controller c(instr[31:26], instr[5:0], RegDst, PCSrc, ALUSrc, ALUSrc1, 
					MemtoReg, RegWr, MemWr, nPC_sel, EXTOp, sb, lh, ALUctr);
	datapath   dp(clk, reset, instr, ReadData, RegDst, PCSrc, ALUSrc, ALUSrc1, MemtoReg, RegWr, 
					nPC_sel, EXTOp, sb, lh, ALUctr, PC, MemData, ALUout);
	
endmodule
