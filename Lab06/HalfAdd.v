module HalfAdd(Cout, Sum, A, B);
	input A, B;
	output Cout, Sum;
wire a1, a2, a3, x, y;
  nand nand1(a1, A, B);
  nand nand2(a2, A, a1);
  nand nand3(a3, B, a1);
  nand nand4(Sum, a2, a3);
  nand nand5(Cout, a1);
/*
initial //This initial block used to dump all wire/reg values to dump file
     begin
       $dumpfile("HalfAdd.vcd");
       $dumpvars(0,HalfAdd);
     end
*/
  endmodule
