.data
msg1: .asciiz "Enter size of the array: "
msg2: .asciiz "Enter elements in the array: "

.text
get_size:
li $v0,  4
la $a0,  msg1
syscall             # print msg
li $v0, 5 # load syscall read_int into $v0.
syscall
move $s2, $v0 # move the number read into $v0. $s2 contains the size of the array.
addi $s1, $zero, 11 #maximum element size is 10, $s1=11
slt $t1, $s2, $s1 # if ($s1 <= $s2) check if the max number of element is exceeded.
beq $t1, $zero, get_size #branch to the label size again if it is exceeded else continue s2 is the size


set_min_max:
li $s3, 1 #max is $s3
li $s4, 100 #min is $s4

print_elements_msg: 
li $v0,  4
la $a0,  msg2
syscall             # print msg

get_elements:        
    li $v0,5
    syscall
    beq $t0,$s2,exit
    addi $t0,$t0,1
    
    
    
set_min:
    slt $t2, $s3, $v0 # check min if($v0 <= $s3) if it is true then go to set_min label.
    beq $t2, $zero, set_max
    move $s3, $v0
    
set_max:
   slt $t2, $v0, $s4
   beq $t2, $zero, get_elements
   move $s4, $v0
   j get_elements

exit:
    li $v0,10
    syscall
   
