`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:34 11/26/2017 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
	 input clk,
    input reset,
    input [31:0] instr,
	 input [31:0] ReadData,//////////
    input [1:0] RegDst,
    input [1:0] PCSrc,
    input ALUSrc,
    input ALUSrc1,
    input [1:0] MemtoReg,
    input RegWr,
    input nPC_sel,
    input [1:0] EXTOp,
	 input sb, lh,
    input [2:0] ALUctr,
	 output [31:0] PC,
    output [31:0] MemData, // MemData = RD2
    output [31:0] ALUout
    );
	 
	 wire zero;
	 wire [31:0] PCplus4;
	 wire [31:0] to_res, res;
	 wire [31:0] ext_to_res_lo, ext_to_res_hi, LH_res;
	 wire selNPC0;
    wire [4:0] A1, A3;///
	 wire [31:0] signimm, signimmsh, unsignimm, immzero;
	 wire [31:0] NPC, PCbranch, NPC0, NPC1;
	 wire [31:0] RD1, RD2;
	 wire [31:0] EXTout;
	 wire [31:0] ALUB;
	 wire [31:0] SBdata;

	 assign selNPC0 = nPC_sel & zero;
	 assign NPC1 = {PCplus4[31:28], instr[25:0], 2'b00};
	 
	 //logic of GRF
    mux2 #(5) getA1(instr[25:21], instr[20:16], ALUSrc1, A1);///
	 mux3 #(5) getA3(instr[20:16], instr[15:11], 5'h1f, RegDst, A3);///
	 mux3 #(32) get_to_res(ALUout, ReadData, PCplus4, MemtoReg, to_res);///
	 //++++++++logic if LH 
	 signext   se_to_res_lo(to_res[15:0], ext_to_res_lo);
	 signext   se_to_res_hi(to_res[31:16], ext_to_res_hi);
	 mux2 #(32) getLH_res(ext_to_res_lo, ext_to_res_hi, ALUout[1], LH_res);
	 mux2 #(32) getRse(to_res, LH_res, lh, res);
	 grf       GRF(clk, RegWr, res, A1, instr[20:16], A3, PC, RD1, RD2);  /// MemData = RD2
	 signext   se(instr[15:0], signimm);
	 unsignext unse(instr[15:0], unsignimm);
	 extzero   unsezero(instr[15:0], immzero);
	 
	 //logic of EXT
	 mux3 #(32) getEXT(unsignimm, signimm, immzero, EXTOp, EXTout);
	 
	 //logic of ALU
	 mux2 #(32) getALUB(RD2, EXTout, ALUSrc, ALUB);
	 alu       ALU(RD1, ALUB, ALUctr, zero, ALUout);
	 
	 //logic of PC
	 flopr #(32) pcreg(clk, reset, NPC, PC);               // PC = NPC 
	 adder       pcadd1(PC, 32'b100, PCplus4); ///         // PCplus4  = PC + 4 ...................0
	 sl2         immsh(signimm, signimmsh);   ///          // BEQ offset
	 adder       pcadd2(PCplus4, signimmsh, PCbranch);     // PCbranch = PCplus4 + 4 + offset......1
	 mux2 #(32)  getNPC0(PCplus4, PCbranch, selNPC0, NPC0);// NPC0 = 
	 mux3 #(32)  getNPC(NPC0, NPC1, RD1, PCSrc, NPC);      //
	
	 //logic of SB
	 SBgenerate getSB(ReadData, RD2[7:0], ALUout[1:0], SBdata);
	 mux2 #(32) getMemData(RD2, SBdata, sb, MemData);
	 
	 
endmodule
