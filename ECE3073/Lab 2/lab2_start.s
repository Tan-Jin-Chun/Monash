.global _start

_start:

movia r3, 0x2010
movia r5, 0x00

loop:	movia r4, 0xff
stwio r4, 0(r3)
br loop