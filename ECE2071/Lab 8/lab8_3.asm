# Laboratory Exercise 8_3
# Written by Tan Jin Chun
# The function of the program is to read 8 bits (a byte) from memory location 0x10010000 and perform some bitwise operation
# on the byte and then store that modified byte to memory location 0x10010005
# Last Modified : 13/5/2021

# NOTE : The code below is referenced based on exercise 2

start: 		li $t3, 0xf8f8			
		la $t1, 0x10010000 		# Loading address into $t1
		
repeat:		sb $t3, 0x0($t1)		# store 0xf8f8 at address 0x10010000
		lbu $t2, 0x0($t1) 		# load data at address 0x10010000
		or $t2, 0x0003 			# set 2 least significant bits to 1
		and $t2, 0xfff3 		# set next 2 bits to 0
		xor $t2, 0x0080 		# inverting the most significant 4 bit
		la $t1, 0x10010005		# Loading address (0x10010005) into $t1
		sb $t2, 0x0($t1) 		# store the data at address 0x10010005
		j repeat			# ending the program in a loop

# Another way to make the program to end in an infinite loop
#infinite: 	
#		j infinite			# an infinite loop so that the program will not execute code past the end of the program



