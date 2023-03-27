.section .text
.globl test2

test2:

SUB SP, SP, 0x20
STUR X30, [SP, 0x0]
SUB X1, X0, X1
ADRP X0, msg1
ADD X0, X0, :lo12:msg1
BL printf
LDUR X30, [SP, 0x0]
ADD SP, SP, 0x20
BR X30

.section .data
msg1: .asciz "result = %lld\n "
