# Laboratory Exercise 9_1
# The purpose of this file is to display a rotating pattern on the seven segment device
# Written by Tan Jin Chun
# Last Modified : 13/5/2021

start: 		li $t0, 0xFFFF0010	# Load memory address of seven segment display
		li $t1, 0x1		# Initialise value to write to display
		sll $t2, $t1, 1
		sll $t3, $t2, 1
		sll $t4, $t3, 1
		sll $t5, $t4, 1	
		sll $t6, $t5, 1	
		
repeat: 	sb $t1, 0($t0)		# Write the value 0x1 to seven segment display
		sb $t2, 0($t0)		# Top Right
		sb $t3, 0($t0)		# Bottom Right
		sb $t4, 0($t0)		# Bottom
		sb $t5, 0($t0)		# Bottom Left
		sb $t6, 0($t0)		# Top Left
		j repeat		# Branch to repeat label
