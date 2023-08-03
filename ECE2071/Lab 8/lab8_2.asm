# Laboratory Exercise 8_2 
# Written by Tan Jin Chun
# The purpose of this program is to read from and write to addresses in memory using three different methods
# (load/store word, load/store halfword, load/store byte)
# Last Modified : 13/5/2021
	
start: 		lui $t1, 0x1001 	# Load upper half of memory address, # t1 operand is of incorrect type (should be $t1)
					# lower half is filled with zeros
		
		li $s0, 0x10010004	# Load second memory address as 32-bit value
					# into $s0 using li pseudo-instruction
		
		li $s1, 0x10010008	# Load third memory address into $s1 # 0x10010008 operand is out of range (use li instead of lui)
					
repeat: 	lw $t0, 0x0($t1) 	# Load 32-bit word from the first memory address INTO register $8/$t0 # repeat is not a recognized operator (missing a colon)
		sw $t0, 0x0($s0) 	# Write 32-bit word to the second memory address FROM register $8/$t0
		
		lhu $t2, 0x0($t1) 	# Load 16-bit halfword (interpreted as unsigned) INTO register $t2
		sh $t2, 0x0($s1) 	# Write 16-bit halfword to third memory address FROM register $t2
		
		lbu $t3, 0x3($t1)	# Load 8-bit byte (unsigned) from an offset of 3 from first memory address
		sb $t3, 0x4($s1)	# Store 8-bit byte to the next word address after third memory address
		
		j repeat		# Repeat is not found in symbol table (should be underscore r instead of capitalized R)


.data					# Items below this line will be stored in the
					# .data section of memory
					
.word		0x12345678		# Store the listed value(s) as 32 bit words
					# at the next available locations

# Not sure if I need to explain in more details
# Basically, the program loads three different memory addresses into three separate registers. It will then load
# from one memory location into a register and store from that register to a new memory location using different 
# types of load-store instructions. The loading and storing will then be repeated in an infinite loop