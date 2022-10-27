.data
array: .space 24
newLine: .asciiz "\n"

.text
	addi $s0, $zero, 4
	addi $s1, $zero, 7
	addi $s2, $zero, 9
	addi $s3, $zero, 11
	addi $s4, $zero, 13
	addi $s5, $zero, 15
	
	# Index = $t0
	addi $t0, $zero, 0 # 0 = first location
	sw $s0, array($t0)
	
	addi $t0, $t0, 4  # adding 4 to previous location for next location
	sw $s1, array($t0)

	addi $t0, $t0, 4  # adding 4 to previous location for next location
	sw $s2, array($t0)	
	
	addi $t0, $t0, 4  # adding 4 to previous location for next location
	sw $s3, array($t0)	
	
	addi $t0, $t0, 4  # adding 4 to previous location for next location
	sw $s4, array($t0)	
	
	addi $t0, $t0, 4  # adding 4 to previous location for next location
	sw $s5, array($t0)	
	
	addi $t0, $zero, 0
	while:
		beq $t0, 24, exit_loop # if $t0 == 24 exit the loop
		lw $t6, array($t0)     # load the first element to the register t6

		addi $t0, $t0, 4       # adds 4 every time until 24
 
		# prints current number
		li $v0, 1              # print
		move $a0, $t6          # move number to a0 
		syscall 
		
		# print new line
		li $v0, 4
		la $a0, newLine
		syscall	
			
		j while
	exit_loop:
		li $v0, 10
		syscall
		
		
	
	
