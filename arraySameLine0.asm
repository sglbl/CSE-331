# https://stackoverflow.com/questions/55212566/store-a-user-input-string-of-integers-into-an-integer-array-mips-assembly

.data
input1: .asciiz "Input Row 1: "
row1: .asciiz "Row 1: "
array: .space 16
list: .space 8
.text
la $s0, array              #load address of array to s0
li $s1, 0                  #index of array
li $v0, 4                  #call for print string
la $a0, input1             #load string to be printed
syscall
li $v0, 8                  #call for user input
la $a0, list               #address of where the input will be stored
li $a1, 8                  #space allowed for input
syscall

loop:
add $t2, $zero, $zero     #index of the string
load: 
la $s0, array              #load address of array to s0
la $t0, list               #load adress of the string
sll $t3, $t2, 1            #multiply string index by 2 to skip spaces
sll $t4, $s1, 2            #multiply index of array by 4 for size of word
addu $t0, $t0, $t3         #position string
addu $s0, $s0, $t4         #position array
lbu $t1, 0($t0)            #load byte of the string to t1
addiu $t1, $t1, -48        #convert char to integer
sb $t1, 0($s0)             #store byte into the array
addi $t2, $t2, 1           #increment index of string by 1
addi $s1, $s1, 1           #increment index of array by 1
blt $t2, 4, load           #if the index of the string is less than 4, load the next character
li $v0, 11                 #printing first input as integers from here
addi $a0, $zero, 0xA
syscall
li $v0, 4                  #call for print string
la $a0, row1               #load string to be printed
syscall
li $v0, 1
lb $a0, -12($s0)
syscall
li $a0, 32
li $v0, 11                 # syscall number for printing character
syscall
li $v0, 1
lb $a0, -8($s0)
syscall
li $a0, 32
li $v0, 11                 # syscall number for printing character
syscall
li $v0, 1
li $a0, 32
li $v0, 11                 # syscall number for printing character
syscall
li $v0, 1
lb $a0, 0($s0)
syscall
exit:
li $v0, 10
syscall
