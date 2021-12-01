#	Quiz1_Part3.asm
#	
#	Josue Contreras
#	11-30-2021
#
#	This program calculates Newton's method to approximate the value of sqrt(n)

	.data
txt0:	.asciiz "This program approximates sqrt(n) using Newtons method\n"
txt1:	.asciiz "n:"
txt2:	.asciiz "sqrt(n) = "

	.text
	.globl main
	
main:
	li	$v0, 4		# print string syscall code
	la	$a0, txt0	# address of Intro message
	syscall			# print the string
	
	la	$a0, txt1	# address of 'n' string
	syscall			# print the string
	li	$v0, 6		# read float syscall code
	syscall			# read N 
	
	li.s 	$f1, 1.0	# initial guess
	li.s 	$f2, 2.0	# divisor
	li.s 	$f3, 0.00001	# accuracy limit
	
loop:
	div.s 	$f4, $f0, $f1	# $f4 = (N / x)
	add.s 	$f4, $f4, $f1	# $f4 = x + (N / x)
	div.s 	$f4, $f4, $f2 	# $f4 = (x + (N / x)) / 2
	
	sub.s 	$f1, $f4, $f1	# $f1 = x' - x
	abs.s 	$f1, $f1	# $f1 = |x' - x|
	
	c.lt.s 	$f1, $f3	# $f1 = |x' - x| < 0.00001, check
	bc1t	exit		# true
	nop
	mov.s 	$f1, $f4	# $f1 = x'
	j	loop
	nop
	
exit: 
	li	$v0, 4		# print string syscall  code
	la	$a0, txt2	# address of ans string
	syscall			# prints ans string 
	
	li	$v0, 2		# prints float syscall code
	mov.s	$f12, $f4	# copies x' to $f12
	syscall			# prints the approximate sqrt
	
	li	$v0, 10		# exit syscall code
	syscall