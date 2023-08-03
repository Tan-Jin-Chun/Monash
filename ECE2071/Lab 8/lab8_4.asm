# Laboratory Exercise 8_4
# Written by Tan Jin Chun
# The function of this program is to multiply two numbers together ($t0 and $t1) and to place the result in $s0
# The multiplication should be performed by successive addition
# Last Modified : 13/5/2021

# C code
# a=0; // result accumulated in a, initially it is zero
# b=2; // multiplier
# c=3; // multiplicand
# do{
#  a=a+b;
#  c=c-1;
# } while (c > 0);

# Initial value -> a = 0, b = 2, c = 3
# Final value -> a = 6, b = 2, c = 0
# a = $s0 , b = $t0 , c = $t1

start:	 	li $s0, 0  	# Loading the value of 0
		li $t0, 2	# Loading the value of 2
		li $t1, 3	# Loading the value of 3

repeat: 	add $s0, $s0, $t0   # Adding the a and b together
		subi $t1, $t1, 1    # Decrementing c by 1
		bgtz $t1, repeat    #bgtz is to check if the branch is greater than zero , if it is than branch back to repeat

# NOTE : Let say $t0 and $t1 is assigned to 6 each, the expected value for $s0 would be 36. But the value shown on
# the register on the right would be hexadecimal value not the value in base 10. Thus , instead of 36, it will show
# the equivalent value of 36 in hexadecimal value which is 0x00000024 instead. But since it is only 2*3 = 6. Thus,
# the hexadecimal value will be #0x00000006
		


 