`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:46 11/26/2017 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input clk,
    input RegWr,
    input [31:0] res,    //Wdata
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,      //Waddr
	 input [31:0] WPC,    //WPC
    output [31:0] RD1,   
    output [31:0] RD2
    );
	 
	reg [31:0] rf[31:0];
	
	integer i;
	
	initial begin 
		for(i = 0; i <= 31; i = i + 1) begin
			rf[i] <= 0;
		end
	end
	
	always @(posedge clk) begin
		if(RegWr) begin 
			$display("@%h: $%d <= %h", WPC, A3, res);		
			rf[A3] <= res;	
		end
	end
		
	assign RD1 = (A1 != 0) ? rf[A1] : 0;
	assign RD2 = (A2 != 0) ? rf[A2] : 0;

endmodule
