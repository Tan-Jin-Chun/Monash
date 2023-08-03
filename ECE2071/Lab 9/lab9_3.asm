# Laboratory Exercise 9_3
# Written by Andy russell 20/03/2009 
# Written by Tan Jin Chun
# Last Modified : 13/5/2021

start: 		li  $a0, 0x0003		# load argument register $a0 with number to be squared					
		jal square      	# call the recursive function to calculate the square
		
infinite: 	j infinite 		# wait here when the calculation has finished 
					# $v0 contains the result

#---------------------------------------------------------------
#square - input parameter $a0 contains number to be squared
#         result returned in register $v0
#---------------------------------------------------------------		
square: 	addi $sp, $sp, -8	# decrement the stack pointer $sp # pushing the stack down by 8 bytes (2 slots)
		sw  $ra, 4($sp)		# push the return address register $ra
		sw  $a0, 0($sp)		# push argument register $a0
		li  $t0, 0x0001		# load $t0 with 1 as part of test for base case # check for base case
		bne $a0, $t0, notbase	# branch if not the base case
		li $v0, 0x0001		# return base result in $v0
		addi $sp, $sp, 8	# recover stack space (Note: did not corrupt registers)
		jr $ra			# jump to return address in $ra

notbase: 	#*****************************************
		#your code for the non-base case goes here 
		addi $a0, $a0 , -1  # decrementing a0 by 1
		mul $t0, $a0, 2		# multiply by 2
		addi $t1, $t0, 1	# add 2*(n-1) by 1
		mul $v0, $a0, $a0	# multiply the (n-1) by itself
		add $v0, $v0 , $t1 	# add the two final values together
		#jal square		# jumping back to check for base case
		#*****************************************
		jr $ra			# jump to contents of return address register $ra
