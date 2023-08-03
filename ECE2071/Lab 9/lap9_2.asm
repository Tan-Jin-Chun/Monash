# Laboratory Exercise 9_2
# Written by Tan Jin Chun
# Last Modified : 13/5/2021
	
start: 		li $t0, 0xFFFF0010	# Load memory address of seven segment display
		li $t1, 0x10010000	# Load base memory address of decoder values array
		li $a0, 0x5		# Initialise value to write to display
		li $s0, 0x0		# Saving the value to be iterated
		
	 	jal draw_num		# Call the draw_num function using 'jump and link'
end:		li $s0, 0x0		# Reset it to zero
		j draw_num		# End at infinite loop (Originally) # Changed it to repeat the whole sequence

draw_num:	bgt $s0, $a0, end	# Using a while loop
		add $t2, $t1, $s0	# Calculate address of element in array to access
		lbu $t3, 0($t2)		# Load decoder value byte from memory into $t3
		sb $t3, 0($t0)		# Write decoder value to seven segment display
		addi $s0, $s0 , 1
		j draw_num
		#jr $ra			# Return from function using 'jump register' and $ra


.data					# Items below this line will be stored in the
					# .data section of memory
					
# Store the listed value(s) as 8-bit values at the next available locations
# Basically only 9 digits
.byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F
