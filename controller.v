`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:05 11/26/2017 
// Design Name: 
// Module Name:    controller 
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
module controller(
    input [5:0] opcode,
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
	 output sb, lh,
    output [2:0] ALUctr
    );
	wire [1:0] ALUop;
	
	maindec md(opcode, funct, RegDst, PCSrc, ALUSrc, ALUSrc1, MemtoReg, RegWr, MemWr, nPC_sel, EXTOp, sb, lh, ALUop);
	aludec ad(funct, ALUop, ALUctr);

endmodule
