.global _start
_start:

movia r3, 0x2010
movia r5, 0x00
movia r6, 0x01
movia r8, 0x01
movia r9, 0x01

loop:	movia r4, 0xff
stwio r6, 0(r5)
add r10, r8, r9
stwio r0, 0(r5)
stwio r4, 0(r3)
br loop