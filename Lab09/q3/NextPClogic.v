module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output reg [63:0] NextPC; 

   /* write your code here */ 
//wire [63:0] SignExtImm64Shifted;
//	always@(*) begin
		if((Branch && ALUZero) | Uncondbranch) begin
			assign SignExtImm64 = SignExtImm64<< 2;
			assign NextPC = CurrentPC + SignExtImm64;
		end
		else 
			assign NextPC = CurrentPC + 4;
endmodule
