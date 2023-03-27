module HalfAdd ( Cout , Sum , A, B ) ;
  input A, B ;
  output Cout , Sum ;
  wire a1, x, y;
  nand nand1(a1, A, B);
  nand nand2(a1, A, x);
  nand nand3(a1, B, y);
  nand nand4(Sum, x, y);
  nand nand5(Cout, a1);

  end module
