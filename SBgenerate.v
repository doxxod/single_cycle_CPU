`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:16 11/29/2017 
// Design Name: 
// Module Name:    SBgenerate 
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
module SBgenerate(
	input [31:0] ReadData,
	input [7:0] s,
	input [1:0] Addr,
	output [31:0] SBdata
    );
	reg [31:0] out;
	assign SBdata = out;
	
	always @*
		case(Addr)
			2'b00: out <= {ReadData[31:8], s};
			2'b01: out <= {ReadData[31:16], s, ReadData[7:0]};
			2'b10: out <= {ReadData[31:24], s, ReadData[15:0]};
			2'b11: out <= {s, ReadData[23:0]};
		endcase

endmodule
