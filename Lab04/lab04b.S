.globl lab04b
.section .text
lab04b:
	SUB SP, SP, 16
	STUR X30, [SP, 8]
        STUR X0, [SP, 0]
	SUB X0, X0, #1
        CBZ X0, if
	B else
	//ADD SP, SP, #16
	//BR X30
if: //n==0, return 1
        // may need to pop the stack
	//LDUR X0, [SP, 0]
	ORR X0, XZR, #1
        BR X30
else:
	//SUB SP, SP, 16
	BL lab04b
        LDUR X1, [SP, 0]
	BL my_mul
	LDUR x30, [sp, 8]
	ADD sp, sp, 16

	BR X30
