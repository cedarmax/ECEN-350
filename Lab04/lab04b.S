.globl lab04b
.section .text

lab04b:
	SUB SP, SP, 16
	STUR X30, [SP, 0]
        stur x0, [sp, 8]
        sub x1, x0, #1
	cbz x0, zero
//        BL lab04b
factorial_loop:
	cbz x1, end
	BL my_mul
	SUB X1, X1, #1
	B factorial_loop
end:
	ldur x30, [sp, 0]
        ldur x0, [sp, 8]
	add sp, sp, 16 
	BR X30
zero:
	ldur x30, [sp, 0]
        ldur x0, [sp, 8]
	add sp, sp, 16
	add x0, x0, #1
	BR X30
