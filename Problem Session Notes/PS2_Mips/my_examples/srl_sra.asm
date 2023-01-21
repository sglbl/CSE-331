.data 
newLine: .asciiz "\n"

.text
#load decimal value 
li $t2, -27 	# b 1110 0101
sra $t3, $t2, 2
srl $t4, $t2, 2

#print
li $v0, 1
move $a0, $t3	# b "1"111 0010
syscall	

# print new line
li $v0, 4
la $a0, newLine
syscall

li $v0, 1
move $a0, $t4 # b "0"111 0010
syscall	
