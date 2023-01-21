li $a0,10
li $a1,21
li $a3,31

# ra = return address;  sp = Stack Pointer
# jal = jump and link -> R[31] = PC + 8; PC = JumpAddr
jal eq # Now the result of the function is $v0.

move $a0, $v0
li $v0, 1
syscall 

li $v0,10 # finish
syscall

eq: add $v0,$a0,$a1
    add $v0,$a3,$v0	
    jr $ra  # jr = jump register
