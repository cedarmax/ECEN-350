`define STRLEN 32
module NextPClogicTest_v;

	initial //This initial block used to dump all wire/reg values to dump file
		begin
			$dumpfile("NextPClogicTest_v.vcd");
			$dumpvars(0,NextPClogicTest_v);
		end	

	task passTest;
      input [63:0] actualOut, expectedOut;
      input [`STRLEN*8:0] testType;
      inout [7:0] 	  passed;
      
      if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
      else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
   endtask
   
   task allPassed;
      input [7:0] passed;
      input [7:0] numTests;
      
      if(passed == numTests) $display ("All tests passed");
      else $display("Some tests failed");
   endtask

	//Inputs
	reg [63:0] CurrentPC, SignExtImm64;
	reg Branch, ALUZero, Uncondbranch;
	reg [7:0] passed;

	//Outputs
	wire [63:0] NextPC;

	NextPClogic uut (
		.NextPC(NextPC),
		.CurrentPC(CurrentPC),
		.SignExtImm64(SignExtImm64),
		.Branch(Branch),
		.ALUZero(ALUZero),
		.Uncondbranch(Uncondbranch)
	);

	initial begin
		//Initialize inputs
//		NextPC = 0;
		CurrentPC = 0;
		SignExtImm64 = 0;
		Branch = 0;
		ALUZero = 0;
		Uncondbranch = 0;
		passed = 0;

		#10;

		//Tests:
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'b1, 64'b1, 1'b1, 1'b1, 1'b0};
		#10;
		passTest(NextPC, 64'd2, "Branch and ALUZero test", passed);
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'd2, 64'b1, 1'b0, 1'b0, 1'b1};
		#10;
		passTest(NextPC, 64'd3, "Uncondbranch test", passed);
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'b0, 64'b0, 1'b0, 1'b0, 1'b0};
		#10;
		passTest(NextPC, 64'd4, "else test", passed);
		
		allPassed(passed, 3);
	end
endmodule
