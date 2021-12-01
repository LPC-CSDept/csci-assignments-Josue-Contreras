#	Quiz1_Part2.asm
#	
#	Josue Contreras
#	11-30-2021
#
#	This program calculates the quadratic equation, using
#	A, B, C, and X

	.data
txt0:	.asciiz	"This program will calculate the value of AX^2 + BX + C\n"
txt1:	.asciiz "A:"
txt2:	.asciiz "B:"
txt3:	.asciiz "C:"
txt4:	.asciiz "X:"
txt5:	.asciiz "AX^2 + BX + C:"

	.text
	.globl main
	
main:
	li	$v0, 4		# print string syscall code
	la	$a0, txt0	# address of Intro string
	syscall			# print the string
	
	la	$a0, txt1	# address of 'A' string
	syscall			# print the string
	li	$v0, 6		# read float syscall code
	syscall			# read the float
	mov.s 	$f1, $f0	# cpy A to $f1
		
	li	$v0, 4		# print string syscall code
	la	$a0, txt2	# address of 'B' string
	syscall			# print the string
	li	$v0, 6		# read float syscall code
	syscall			# read the float
	mov.s 	$f2, $f0	# cpy B to $f2
	
	li	$v0, 4		# print string syscall code
	la	$a0, txt3	# address of 'C' string
	syscall			# print the string
	li	$v0, 6		# read float syscall code
	syscall			# read the float
	mov.s 	$f3, $f0	# cpy C to $f3
	
	li	$v0, 4		# print string syscall code
	la	$a0, txt4	# address of 'X' string
	syscall			# print the string
	li	$v0, 6		# read float syscall code
	syscall			# read the float
	mov.s 	$f4, $f0	# cpy X to $f4
	
	mul.s 	$f5, $f4, $f4 	# $f5 = x^2
	mul.s 	$f5, $f5, $f1 	# $f5 = ax^2
	mul.s 	$f2, $f2, $f4 	# $f2 = bx
  	add.s 	$f5, $f5, $f2  	# $f4 = ax^2 + bx
  	add.s 	$f12, $f5, $f3  # $f12 = ax^2 + bx + c
	
	li	$v0, 4		# print string syscall code
	la 	$a0, txt5	# address of end string
	syscall			# prints ending
	
	li	$v0, 2		# print float syscall code
	syscall			# print result float
	
	li	$v0, 10		# exit syscall code
	syscall