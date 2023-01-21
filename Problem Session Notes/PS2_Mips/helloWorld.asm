.data				# Data instructions

msg: 
.asciiz "\nHello, World!\n"	# ascii zero terminated string.

.text 				# Text instructions
main:				# Main section
	
	# li = load immediate  (immediate = program instruction which contains actual data operate, instead of address of data.)
	# la = load address
	li $v0, 4		# 4 = syscall for print string service. (param-> $a0 = address of null-terminated string to print)
	la $a0, msg		# # sending adress of label msg
	syscall

	li $v0, 10		# 10 = exit code. (I think)
	syscall

# SYSCALLLIST => https://courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html 