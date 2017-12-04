`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:41 11/26/2017 
// Design Name: 
// Module Name:    dmem 
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
module dmem(
    input clk, reset,
    input MemWr,
    input [31:0] ALUout,
	 input [31:0] PC,
    input [31:0] MemData,
    output [31:0] ReadData
    );
	 
	reg [31:0] RAM[1023:0];
	
	integer i;
	
	always @(posedge clk) begin
		if(reset) begin
			for(i = 0; i <= 1023; i = i + 1) begin
				RAM[i] <= 0;
			end
		end
		if(MemWr) begin
			RAM[ALUout[11:2]] <= MemData;	
			$display("@%h: *%h <= %h", PC, ALUout, MemData);
		end
	end
	
	assign ReadData = RAM[ALUout[11:2]];
endmodule
