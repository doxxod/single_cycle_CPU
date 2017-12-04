`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:28 11/26/2017 
// Design Name: 
// Module Name:    alu 
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

module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUctr,
    output zero,
    output [31:0] ALUout
    );
	 reg ZERO;
	 reg [31:0] out;
	 
	 assign zero = ZERO;
	 assign ALUout = out;
	 
	always @*
		case(ALUctr)
			`AND: out <= A & B;
			`OR : out <= A | B;
			`ADD: out <= A + B;
			`XOR: out <= A ^ B;
			`SLT: out <= $signed(A) < $signed(B) ? 1 : 0;
			`SLL: out <= A <<< B[10:6];
			`SUB: begin 
						out <= A - B; 
						ZERO <= out == 0 ? 1 : 0;
					end
			default: out <= 0;
		endcase	 
		
endmodule
