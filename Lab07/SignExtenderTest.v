`define STRLEN 15
module SignExtenderTest;

	initial
		begin
			$dumpfile("SignExtenderTest.vcd");
			$dumpvars(0,SignExtenderTest);
		end
	task passTest;
		input [63:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask
	
	// Inputs
	 	reg [1:0] Ctrl;
	 		reg [25:0] Inst26 ;
		reg [7:0] passed;
//	reg [63:0] b;

 	// Outputs
	 				wire [63:0] BusImm;
 					// Instantiate the Unit Under Test (UUT)
	 						SignExtender uut (
	 								.Ctrl(Ctrl), 
	 								.Inst26(Inst26),
									.BusImm(BusImm)
	 											);
				initial begin
	 	// Initialize
	 	//inputs
	 	Ctrl = 0;
		Inst26 = 0;
		passed = 0;
		//reg [63:0] b;
//		b = {{38{Inst26[25]}} + Inst26};
	
		#90; {Inst26, Ctrl} = {26'b11, 2'b10}; #10; passTest(BusImm, 63'b11, "b type input", passed);  //b
 		#90; Ctrl = 2'b00; #10; passTest(BusImm, {52{Inst26[21]}} + Inst26[21:10], "i type input", passed);  //i type
		#90; Ctrl = 2'b01; #10; passTest(BusImm, {55{Inst26[20]}} + Inst26[20:12], "d type input", passed);  //d type
		#90; Ctrl = 2'b11; #10; passTest(BusImm, {45{Inst26[23]}} + Inst26[23:5], "cbz type input", passed);  //cbz

		end
endmodule
