`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:13 11/26/2017 
// Design Name: 
// Module Name:    aludec 
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
`define AND 3'b000
`define OR  3'b001
`define ADD 3'b010
`define XOR 3'b011
`define SLT 3'b100
`define SLL 3'b101
`define SUB 3'b110

`define ADDU_F 6'b100001
`define SUBU_F 6'b100011
`define SLT_F  6'b101010
`define SLL_F  6'b000000
`define JR_F   6'b001000

module aludec(
	 input [5:0] funct,
    input [1:0] ALUop,
    output [2:0] ALUctr
    );
	reg [2:0] ctr;
	assign ALUctr = ctr;
	
	always @*
		case(ALUop)
		2'b00: ctr <= `ADD;
		2'b01: ctr <= `SUB;
		2'b11: ctr <= `OR;
		default: case(funct)
			`ADDU_F: ctr <= `ADD; //ADDU;
			`SUBU_F: ctr <= `SUB; //SUBU;
			`SLL_F : ctr <= `SLL; //SLL;
			`JR_F  : ctr <= `ADD; //JR;
			`SLT_F : ctr <= `SLT; //SLT;
			default:  ctr <= 3'bxxx; 
		 endcase
	  endcase

endmodule
