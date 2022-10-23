# Suleyman Golbol 1801042656

.data 
	prompt1: .asciiz "Enter size of array (n): "
	prompt2: .asciiz "Enter k: "
	out1: .asciiz "\nn is : "
	out2: .asciiz ", k is : "
.text

main:
	### Take n ###
	# prompt1 
	li $v0, 4 # 4 = to print a string
	la $a0, prompt1
	syscall
	
	# taking input1 (n)
	li $v0, 5
	syscall

	# store the result n in $t0
	move $t0, $v0

	### Take k ###	
	# prompt2
	li $v0, 4 # 4 = to print a string
	la $a0, prompt2
	syscall
	
	# taking input2 (k)
	li $v0, 5
	syscall
	
	# store the result k in $t1
	move $t1, $v0
	
	### Display numbers ###
	# Display "n is : "  
	li $v0, 4 
	la $a0, out1
	syscall

	# Print n
	li $v0, 1 # 1 = to print an integer 
	move $a0, $t0
	syscall

	# Display "k is : " 
	li $v0, 4 
	la $a0, out2
	syscall
		
	# print k
	li $v0, 1 # 1 = to print an integer 
	move $a0, $t1
	syscall

arrayTaker: 
	
