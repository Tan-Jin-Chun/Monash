# Laboratory Exercise 8_1
# Written by Tan Jin Chun
# The function of this program is to carry out the addition and subtraction loaded in the two registers
# Last Modified : 13/5/2021

start: 		li $t0, 0x1 		# Load the value 1  # start is not a recognized operator (lack a colon)
		li $t1, 0x2 		# Load the value 2  # operand is of incorrect type
		add $t2, $t0, $t1 	# Add the values, store in $t2 # $t1 operand is of incorrect (use add instead of addi)
		sub $t3, $t1, $t0	# Subtract value 1 from value 2, store in $t3 # t0 is of incorrect type (use $to instead of t0)
infinite:
		j infinite		# an infinite loop so that the   # jump is not a recognize operator (use j instead)
					# computer will not execute code
					# past the end of the program
					
# Step 6 : When the step command is used, the program will execute it's function one line at a time and show changes
# to the registers on the right.
# Step 7: The registers and the program counter will stop executing at the line where there is the add instruction
# when a breakpoint is set at the add instruction. (Only $t0 and $t1 registers will have their value stored but the addition function will not be carried out)
# This means that the value of 3 will not appear in the register $t2
# If there was no breakpoint, the rest of the command will continue to be executed.