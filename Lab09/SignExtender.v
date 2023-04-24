module SignExtender(BusImm, Inst26, Ctrl);
	output reg [63:0] BusImm;
	input [25:0] Inst26; 
	input [2:0] Ctrl; 

	reg extBit; 
//	assign extBit = (Ctrl ? 1'b0 : Inst26[25]); 
//	assign BusImm = {{26{extBit}}, Inst26}; 
	always@(*)
	begin
	if (Ctrl == 3'b000) //I type
		begin
			extBit = 1'b0;
			BusImm = {{52{extBit}}, Inst26[21:10]};
		end
	else if (Ctrl == 3'b001) //D type
		begin
			extBit = Inst26[20];
			BusImm = {{55{extBit}}, Inst26[20:12]};	
		end
	else if (Ctrl == 3'b010) //B
		begin
			extBit = Inst26[25];
			BusImm = {{38{extBit}}, Inst26[25:0]};
            //$display("extBit = %h, BusImm = %h\n", extBit, BusImm);
		end
	else if (Ctrl == 3'b011) //CBZ
		begin
			extBit = Inst26[23];
			BusImm = {{45{extBit}}, Inst26[23:5]};
		end
//	else 
	else if (Ctrl == 3'b111) //CBZ
		begin
			extBit = Inst26[23];
			BusImm = {48'b0,Inst26[20:5]} << (Inst26[22:21] * 16);
		end
	end
endmodule
