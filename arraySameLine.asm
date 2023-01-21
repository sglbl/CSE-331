# Yuhuan Xie 
# Lab 2 CS10 
 
.data  
prompt: .asciiz "Input Row "  
colon: .asciiz ": " 
Output: .asciiz "\nOutput Row "  
space: .asciiz " " 
newline: .asciiz "\n" 
array: .space 33  
char: .space 2  
 
.text 

main: 
 
li $t9, 1 # counter for prompt 
la $s1, array #set base address of array to s1 
 
# main loop at beginning of the program that prompts for Input row 4 times, each time continuing to take input until a newline character is found 
prompt_loop:  
beq $t9, 5, finished_input # ends this when we are about to start the 5th iteration 
la $a0, prompt #load prompt message into $a0  
li $v0, 4 # printstring  
syscall  
la $a0, ($t9) #load prompt message into $a0 for syscall  
li $v0, 1 # printstring   
syscall  
la $a0, colon # load colon into $a0  
li $v0, 4 # printstring 
syscall 
 
# read loop deels with newline and spaces by giving control flow away to other places, adapted from Stack Overflow answer about processing strings 
# to integers 
 
read_loop: #start of read loop 
 
jal getc #jump to getc subroutine 
 
#storing char into array  
lb $t0, char #load the char from char buffer into t0, stripping space  
 
sb $t0, 0($s1) #store the char into the nth elem of array 
 
#checking for end of line  
lb $t1, newline #load newline char into t1  
beq $t0, $t1, prompt_counter_increase  #end of string? jump to finished_looping 
 
#checking for space 
lb $t1, space #load newline char into t1  
beq $t0, $t1, read_loop # keeps going as though nothing has happened if we run across a space 
addi $s1, $s1, 1 # increments base address of array j loop #jump to start of read loop 
 
# get character subroutine found on Stack Overflow and slightly modified  
getc: #read char from keyboard buffer and return ascii value  
li $v0, 8 # read string  
la $a0, char #load address of char 
li $a1, 2 # length of string is 1byte char and 1byte for space, defined above already 
syscall # store the char byte from input buffer into char  
jr $ra #jump-register to calling function, which is back to read_loop 
 
# increments counter after successfully encountering a newline char 
prompt_counter_increase: 
addi $t9, $t9, 1 # increment counter 
j prompt_loop # jumps back to prompt_loop because we need next line 
 
# resets the counter so elements can be spit back out the same order and also loads the array again, pretty much just reset everything 
finished_input: 
addi $t9, $t9, -4 # resets the counter because the way we have it set up we increment it again to echo everything in the right order 
la $s1, array # loads the array back into $s1 
 
# this pretty much does what prompt_loop did but in reverse 
output_loop: 
 
beq $t9, 5, end_program # same concept, we have reset $t9 earlier in finished_input 
la $a0, Output #load output prompt to $a0 
li $v0, 4 # print string  
syscall  
la $a0, ($t9) # load prompt message into $a0 for syscall  
li $v0, 1 # print int  
la $a0, colon #load prompt message into $a0   
li $v0, 4 # print string  
syscall  
li $t3, 1 # this counter is used 
 
# turns ascii to int, this method takes our array and reformats it into how it looked when it was input, ie we add spaces 
string_to_integer:  
beq $t3, 5, output_counter_increase  
addi $t3,$t3,1 # increment counter 
lb $a0,($s1) # load byte of the first char 
lb $t1, newline #load newline char into t1 
beq $a0, $t1, end_program #end of string? jump to finished_looping 
 
addi $a0, $a0,-48 # turns ascii to int 
li $v0, 1 # print int  
syscall  
la $a0, space # load prompt message into $a0 for syscall 
li $v0, 4 #load syscall to print string  
syscall  
addi $s1, $s1, 1 #increments base address of array 
 
j string_to_integer # loops back itself 
 
#increments output counter 
output_counter_increase: 
 
addi $t9, $t9, 1 #increment 
j output_loop # back to the loop again 
 
#ends the program 
end_program:  
 
li $v0, 10 #exits 
syscall
