`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:02 11/28/2017
// Design Name:   mips
// Module Name:   E:/signal_cycle_CPU/testbench.v
// Project Name:  signal_cycle_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;
	reg reset;
	// Outputs
	

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		#10;
		reset= 0;
		// Wait 100 ns for global reset to finish
		#400;
      $stop;
		// Add stimulus here

	end
     always #5 clk = ~clk;
endmodule

