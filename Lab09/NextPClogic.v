module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output reg [63:0] NextPC; 

   /* write your code here */ 
//wire [63:0] SignExtImm64Shifted;
always@(*) begin
		if((Branch && ALUZero) | Uncondbranch) begin
			//SignExtImm64 = SignExtImm64<< 2;
			NextPC = CurrentPC + (SignExtImm64 << 2);
            //$display("CurrentPC = %h, NextPC = %h, SignExtImm64 << 2 = %h\n", CurrentPC, NextPC, (SignExtImm64 << 2));
		end
		else 
			NextPC = CurrentPC + 4;
end
endmodule
