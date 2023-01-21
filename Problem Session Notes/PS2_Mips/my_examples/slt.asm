.data 
newLine: .asciiz "\n"

.text
#SLT
#load decimal value 
li $t2, -27 	# b 1110 0101
li $t3, 10	# b 0000 1010
slt $t1, $t2, $t3

### PRINTING ###
# print value
li $v0, 1
move $a0, $t1	# b 1 since t2<t3 so result=1
syscall	

# print new line
li $v0, 4
la $a0, newLine
syscall
### END PRINTING ###

# SLTU
#load decimal value 
li $t2, -27 	# b 1110 0101
li $t3, 10	# b 0000 1010
sltu $t1, $t2, $t3

### PRINTING ###
# print value
li $v0, 1
move $a0, $t1	# b 0 since t2>t3
syscall	

# print new line
li $v0, 4
la $a0, newLine
syscall
### END PRINTING ###
