`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:24 11/26/2017 
// Design Name: 
// Module Name:    flopr 
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
module flopr #(parameter WIDTH = 8)(
    input clk,
    input reset,
    input [WIDTH - 1:0] d,
    output [WIDTH - 1:0] q
    );
	reg [WIDTH - 1:0] Q;
	
	assign q = Q;
	
	//initial Q = 32'h00003000;
	
	always @(posedge clk)
		if(reset) Q <= 32'h00003000;
		else begin 
			Q <= d;
		end
		
endmodule
