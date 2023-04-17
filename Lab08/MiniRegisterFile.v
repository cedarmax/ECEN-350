`timescale 1ns / 1ps

module MiniRegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RA;
    input [4:0] RB;
    input [4:0] RW;
    input RegWr;
    input Clk;
    reg [63:0] register[31:0]; // 32 64 bit registers 
	    
    assign #2 BusA = (RA == 31) ? 0 :register[RA]; // RA are on BUS A after 2 sec 
    assign #2 BusB = (RB == 31) ? 0 :register[RB]; // RB are on Bus B after 2 sec
     
    always @ (negedge Clk) begin 
        if(RegWr & RW != 31)
            register[RW] <= #3 BusW; //Data on busW stored on Rw
    end
endmodule
