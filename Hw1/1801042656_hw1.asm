# Suleyman Golbol 1801042656

.data 

array: .space 400
promptN:  .asciiz "Enter size of array (n): "
promptK:  .asciiz "Enter k: "
promptElement: .asciiz "Enter array elements (seperated by enter): "
outElement: .asciiz "Array elements are: "
outN: .asciiz "\nn is : "
outK: .asciiz ", k is : "
outError: .asciiz "You entered out of constraints. Please try again"

newLine: .asciiz "\n"
arPrint1: .asciiz "ar["
arPrint2: .asciiz "] + ar["
arPrint3: .asciiz "] = " 
endPrint: .asciiz "Total Number of Pairs: "

####
#  t0 = n
#  t1 = i variable
#  t2 = j variable
#  t3 = array[i]
#  t4 = array[j]
#  t5 = array[i] + array[j]
#  t6 = Last index of n multiplied by 4
#  t7 = k
#  t8 = (array[i] + array[j]) % k
#  t9 = Pair sum 
####

.text
main:
	jal takeNKInputs
	jal takeArrayInputs
	jal numberHandler
	
takeNKInputs:
	# Print text to get n
	li $v0, 4
	la $a0, promptN 
	syscall

        #read # of input (n)
	li $v0, 5
	syscall
	addi $t0, $v0, 0 # move is also okay
	
	# Print text to get k
	li $v0, 4
	la $a0, promptK
	syscall
	
	# read k 
	li $v0, 5
	syscall
	move $t7, $v0
	
	# print "n is "
	li $v0, 4
	la $a0, outN
	syscall	
	
	# print integer n
	li $v0, 1
	move $a0, $t0
	syscall	
	
	# print "k is "
	li $v0, 4
	la $a0, outK
	syscall	
	
	# print integer k
	li $v0, 1
	move $a0, $t7
	syscall
	
	# print new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	constraintChecker:
		# if 2 <= n <= 100 is not satisfied, print error 
		bgt $t0, 100, printError	
		blt $t0, 2, printError
		# if 1 <= k <= 100 is not satisfied, print error 
		bgt $t0, 100, printError	
		blt $t0, 1, printError	  
	
	jr $ra
	
printError:
	# print "You entered wrong number."
	li $v0, 4
	la $a0, outError
	syscall	
		
	j halt
	

takeArrayInputs:
	# Make t0 = n
      
      	# Prompt to get element
	li $v0, 4
	la $a0, promptElement
	syscall

    	#used to index of array at insertion. At the end, it will show last element index in array
	li $t6, 0  
        
	j numberReaderLoop

        # get array numbers as input and keep them in list
	numberReaderLoop:     # for(int $t0 = n;  $t0 != 0;  $t0--)

        	beq $t0, 0, numberReaderLoopExit # if($t0 == 0) break;
            	
            	# read integer
        	li $v0, 5
        	syscall	
        	sw $v0, array($t6)      # save input in array
        	
        	# Error checker
        	bgt $v0, 100, printError	
		blt $v0, 1, printError
        	
        	addi $t6, $t6, 4	# increment index of array by 4. ($t6 was 0 in the beginning.)
            	
        	addi $t0, $t0, -1	# i--
        	j numberReaderLoop	# continue on loop

	numberReaderLoopExit:
	
	# Print text
	li $v0, 4
	la $a0, outElement	 # "Array elements are: "
        syscall
        
        # Print new line
        li $v0, 4
        la $a0, newLine
        syscall
        
        # End of takeArrayInputs() function
        jr $ra
  
	
numberHandler:
	##############
        move $t0, $t6		# t6 was n'th index address counter (last element).
	addi $t3, $zero, 0	# array[i] = 0
	addi $t4, $zero, 0	# array[j] = 0
	addi $t9, $zero, 0 	# int pair_sum = 0
	
	# OUTER WHILE LOOP
	addi $t1, $zero, 0	# $t1 = i = 0
	while:			# for(int $t1 = 0; $t1 <= (lastIndexOfArray $t6); $t1 += 4)
		bge $t1, $t6, exit_loop		# if ($t1 >= $t6) break 
												
 		lw $t3, array($t1)	# load array's ($t3)^th to t1.
 
 		# INNER WHILE LOOP
		addi $t2, $t1, 4     # start j from i+1 ($t1+4) last array index by incrementing 4 by 4. (j)
		while2:
			bge $t2, $t6, exit_loop2
			
			lw $t4, array($t2)	# load array's ($t2)^th to t4.   $t4 = array[j]
			add $t5, $t3, $t4      # t5 = array[i] + array[j]
			
			# put remainder of division to $t9
			rem $t8, $t5, $t7
			beq $t8, $zero, incrementPairCounter
			bne $t8, $zero, dontIncrementPairCounter
			
			incrementPairCounter:
				addi $t9, $t9, 1	# pair_sum++
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
		move $a0, $t9
		syscall 
		# print new line
		li $v0, 4
		la $a0, newLine
		syscall	

		j halt
						
textPrinter: # Function
	addi $t0, $zero, 4 # Use $t0 = 4 (to use as address index/4)

	# print str "ar["
	li $v0, 4
	la $a0, arPrint1
	syscall		
	
	# print i
	li $v0, 1    
	div $t0, $t1, $t0
	move $a0, $t0
	syscall
	
	# print str "] + ar["
	li $v0, 4
	la $a0, arPrint2
	syscall	
		
	addi $t0, $zero, 4 # Use $t0 as value 4 (to use as index)
	
	# print j
	li $v0, 1
	div $t0, $t2, $t0
	move $a0, $t0
	syscall				
	
	# print str "] = "
	li $v0, 4
	la $a0, arPrint3
	syscall		
	
	# prints ar[i] + ar[j]
	li $v0, 1              
	move $a0, $t5
	syscall
	
	# print new line
	li $v0, 4
	la $a0, newLine
	syscall		
	
	# Go back where it left			
	jr $ra
	

halt:
	# Halt program
	li $v0, 10
	syscall
