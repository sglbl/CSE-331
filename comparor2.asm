.data
array: .space 24
newLine: .asciiz "\n"
arPrint1: .asciiz "ar["
arPrint2: .asciiz "] + ar["
arPrint3: .asciiz "] = " 
endPrint: .asciiz "Total Number of Pairs: "

#### For a array has size n = 6
#  s0 = array[0]  |  t0 = iterator on memory adress of $array
#  s1 = array[1]  |  t1 = i variable
#  s2 = array[2]  |  t2 = j variable
#  s3 = array[3]  |  t3 = Total # of pairs
#  s4 = array[4]  |  t6 = array[i]
#  s5 = array[5]  |  t7 = array[j]
#  s6 = k         |  t8 = array[i] + array[j]
####


.text
	addi $s0, $zero, 1
	addi $s1, $zero, 3
	addi $s2, $zero, 2
	addi $s3, $zero, 6
	addi $s4, $zero, 1
	addi $s5, $zero, 2
	
	addi $s6, $zero, 3 # k
	
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
	
	# int pair_sum = 0
	addi $t3, $zero, 0 	# Initialize pair counter to 0
	
	# OUTER WHILE LOOP
	addi $t1, $zero, 0	# start from 0 to 24 by incrementing 4 by 4 (int i = 0)
	while:
		bge $t1, 24, exit_loop # if $t1 == 24 exit the loop
		lw $t6, array($t1)     # load the element to the register t6											
 
 
 		# INNER WHILE LOOP
		addi $t2, $t1, 4     # start from 4 to 24 by incrementing 4 by 4. (j)
		
		while2:
			
			bge $t2, 24, exit_loop2
			
			lw $t7, array($t2)     # load the array[j] to register t7
			add $t8, $t6, $t7      # t8 = array[i] + array[j]
			
			# blt $t8, $s6, incrementPairCounter # s6 = K number
			
			# MAKE DIVISIBLE AND DONE
			rem $t9, $t8, $s6
			beq $t9, $zero, incrementPairCounter
			bne $t9, $zero, dontIncrementPairCounter
			
			incrementPairCounter:
				addi $t3, $t3, 1	# pair_sum++
				jal textPrinter
								
			dontIncrementPairCounter:
				# do nothing
			
			addi $t2, $t2, 4 # increment counter of inner loop (j++)
			j while2
		exit_loop2:	
		addi $t1, $t1, 4       # adds 4 every time until 24 (i++)	
		j while
	exit_loop:
		# Print "Total Number of Pairs: "
		li $v0, 4
		la $a0, endPrint
		syscall
		# prints pair sum
		li $v0, 1    
		move $a0, $t3
		syscall 
		# print new line
		li $v0, 4
		la $a0, newLine
		syscall	
		# Halt program
		li $v0, 10
		syscall
		
textPrinter: # Function
	# print str "ar["
	li $v0, 4
	la $a0, arPrint1
	syscall		
	# print i
	li $v0, 1          
	move $a0, $t1
	syscall
	# print str "] + ar["
	li $v0, 4
	la $a0, arPrint2
	syscall		
	# print j
	li $v0, 1
	move $a0, $t2
	syscall				
	# print str "] = "
	li $v0, 4
	la $a0, arPrint3
	syscall		
	# prints ar[i] + ar[j]
	li $v0, 1              
	move $a0, $t8
	syscall
	# print new line
	li $v0, 4
	la $a0, newLine
	syscall		
	# Go back where it left			
	jr $ra
	
	
