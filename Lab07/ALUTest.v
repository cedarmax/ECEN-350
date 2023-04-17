`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
 module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

 //ADD 
#40; {BusA, BusB, ALUCtrl} = {64'h1, 64'h1, 4'h2}; #40; passTest({Zero, BusW}, 65'h00000000000000002, "ADD 0x1234,0xABCD0000", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h0, 4'h2}; passTest({Zero, BusW}, 65'h00000000000000002, "asdf", passed);	

#40; {BusA, BusB, ALUCtrl} = {64'h1, 64'h0, 4'h2}; #40; passTest({Zero, BusW}, 65'h00000000000000001, "ADD 0xFF00,0xFF", passed);

//SUB
#40; {BusA, BusB, ALUCtrl} = {64'h2, 64'h2, 4'h6}; passTest({Zero, BusW}, 65'h00000000000000001, "SUB 0x2,0x2", passed);//4'b0110

#40; {BusA, BusB, ALUCtrl} = {64'h3, 64'h2, 4'h6}; #40; passTest({Zero, BusW}, 65'h1, "SUB 0x3,0x2", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h2D, 64'h2B, 4'h6}; #40; passTest({Zero, BusW}, 65'h2, "SUB 0x2D,0x2B", passed);
//AND 
#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h0, 4'h0}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "AND 0x0,0x0", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h1, 64'h1, 4'h0}; #40; passTest({Zero, BusW}, 65'h0000000000000001, "AND 0x1,0x1", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h12345678, 4'h0}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "AND 0x0,0x12345678", passed);
//OR
#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h1, 4'h1}; #40; passTest({Zero, BusW}, 65'h1, "OR 0x0,0x1", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h1, 64'h1, 4'h1}; #40; passTest({Zero, BusW}, 65'h1, "OR 0x1,0x1", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h0, 4'h1}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "OR 0x0,0x0", passed);

//PassB
#40; {BusA, BusB, ALUCtrl} = {64'h0, 64'h0, 4'h7}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "PassB 0x0,0x0", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h2, 64'h3, 4'h7}; #40; passTest({Zero, BusW}, 65'h3, "PassB 0x2,0x3", passed);

#40; {BusA, BusB, ALUCtrl} = {64'h2, 64'h2, 4'h7}; #40; passTest({Zero, BusW}, 65'h00000000000000002, "PassB 0x2,0x2", passed);

		allPassed(passed, 15);
	end
      
endmodule

