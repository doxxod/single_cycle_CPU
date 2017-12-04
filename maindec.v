`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:20 11/26/2017 
// Design Name: 
// Module Name:    maindec 
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

//opcode
`define RTYPE 6'b000000
`define LUI   6'b001111
`define ORI   6'b001101
`define LW    6'b100011
`define SW    6'b101011
`define BEQ   6'b000100
`define JAL   6'b000011
`define J     6'b000010
`define SB    6'b101000
`define LH    6'b100001
//funct
`define ADDU_F 6'b100001
`define SUBU_F 6'b100011
`define SLT_F  6'b101010
`define SLL_F  6'b000000
`define JR_F   6'b001000

module maindec(
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
	 output [1:0] ALUop
    );
	 
	assign RegDst = (opcode == `RTYPE) * ((funct == `ADDU_F) + (funct == `SUBU_F) + (funct == `SLL_F) + (funct == `SLT_F)) ? 1 : opcode == `JAL ? 2 : 0;
	assign PCSrc = (opcode == `J) + (opcode == `JAL) ? 1 : (opcode == `RTYPE) * (funct == `JR_F) ? 2 : 0;
	assign ALUSrc = (opcode == `RTYPE) * (funct == `SLL_F) + (opcode == `SB) + (opcode == `LH) + (opcode == `ORI) + (opcode == `LW) + (opcode == `SW) + (opcode == `LUI) ? 1 : 0;
	assign ALUSrc1 = (opcode == `RTYPE) * (funct == `SLL_F) ? 1 : 0;
	assign MemtoReg = (opcode == `RTYPE) * (funct == `JR_F) + (opcode == `LW) + (opcode == `LH)? 1 : opcode ==`JAL ? 2 : 0;
	assign RegWr = (opcode == `RTYPE) * ((funct == `ADDU_F) + (funct == `SUBU_F) + (funct == `SLL_F) + (funct == `SLT_F)) + (opcode == `ORI) + (opcode == `LW) + (opcode == `LUI) + (opcode == `JAL) + (opcode == `LH)? 1 : 0;
	assign MemWr = (opcode == `SW) + (opcode == `SB) ? 1 : 0;
	assign nPC_sel = opcode == `BEQ ? 1 : 0;
	assign EXTOp = (opcode == `SB) + (opcode == `LH) + (opcode == `LW) + (opcode == `SW) + (opcode == `BEQ) ? 1 : opcode == `LUI ? 2 : 0;
	assign ALUop = opcode == `BEQ ? 1 : opcode == `RTYPE ? 2 : opcode == `ORI ? 3 : 0;
	assign sb = opcode == `SB ? 1 : 0;
	assign lh = opcode == `LH ? 1 : 0;
endmodule
