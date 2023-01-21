.data
wrd1: .word 0xBABADEDE
wrd2: .word 0xBEBECABA
try: .word 0xabba

.text
#load decimal value 
li $t1, 5555
#load hexadecimal value
li $t1, 0x5555
la $t1, try    # reg[t1] = &label
lw $t1, try    # lw = load word -> reg[t1] = memory[&label]

.
#load 32-bit constant number to register
lw $t1, wrd1 
lw $t3, wrd2

#another version for load 32-bit constant number
la $t2,0xbabadede
#lui $t2, 0xbaba 
#ori $t2, $t2, 0xdede 
lui $t4, 0xbebe  # load upper immediate. So if word is 32 bits; it will load first 16 bits. [Note: BEBE is 4 byte = 32 bits]
ori $t4, $t4, 0xcaba  # ori = or immediate, 0xCABA is immediate value; so result of value in t4 | 0xCABA => will be in $t4

#exercise part1 - merge two register content
srl $t2, $t2, 16 
sll $t4, $t4, 16
add $t5, $zero, $t4
or $t5, $t5, $t2

#exercise part2 - change labeled values 
sw $t3, wrd1	# sw -> store word
sw $t1, wrd2	# sw -> store word
