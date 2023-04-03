module SignExtender(BusImm, Inst26, Ctrl);
	output reg [63:0] BusImm;
	input [25:0] Inst26; 
	input [1:0] Ctrl; 

	reg extBit; 
//	assign extBit = (Ctrl ? 1'b0 : Inst26[25]); 
//	assign BusImm = {{26{extBit}}, Inst26}; 
always@(*)
	begin
	if (Ctrl == 2'b00) //I type
		begin
			extBit = Inst26[21];
			BusImm = {{52{extBit}}, Inst26[21:10]};
		end
	else if (Ctrl == 2'b01) //D type
		begin
			extBit = Inst26[20];
			BusImm = {{55{extBit}}, Inst26[20:12]};	
		end
	else if (Ctrl == 2'b10) //B
		begin
			extBit = Inst26[25];
			BusImm = {{38{extBit}}, Inst26};
		end
	else if (Ctrl == 2'b11) //CBZ
		begin
			extBit = Inst26[23];
			BusImm = {{45{extBit}}, Inst26[23:5]};
		end
//	else 
	end
endmodule
