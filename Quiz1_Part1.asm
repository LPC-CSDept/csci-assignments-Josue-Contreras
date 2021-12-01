#	Quiz1_Part1.asm
#	
#	Josue Contreras
#	11-30-2021
#
#	The program converts Fahrenheit values to Celcius

	.data
txt0:	.asciiz	"This program converts Fahrenheit values to Celcius.\n"
txt1:	.asciiz "Fahrenheit: "
txt2:	.asciiz "Celcius: "
val1:	.float	32.0
val2:	.float	5.0
val3:	.float	9.0

	.text
	.globl main
	
main:
	li	$v0, 4		# print string syscall code
	la	$a0, txt0	# address of the Intro text
	syscall			# print text

	la	$a0, txt1	# address of the Fahrenheit text
	syscall			# print text
	
	li	$v0, 5		# read int syscall code
	syscall			# read int, get Fahrenheit val
	
	mtc1	$v0, $f4	# copy Fahrenheit into $f0
	cvt.s.w	$f5, $f4	# converts Fahrenheit to float val
	
	l.s	$f1, val1	# Celcius = ((Fahrenheit-32.0) * 5.0 )/ 9.0	
	l.s 	$f2, val2	
	l.s 	$f3, val3
	
	sub.s 	$f4, $f5, $f1	# $f4 = (Fahrenheit - 32.0)
	mul.s	$f4, $f4, $f2	# $f4 = (Fahrenheit - 32.0) * 5.0
	div.s 	$f12, $f4, $f3	# $f12 = (Fahrenheit - 32.0) * 5.0 / 9.0
	
	li	$v0, 4		# print string syscall code
	la	$a0, txt2	# address of the Celcius text
	syscall			# print text
	
	li	$v0, 2		# print float syscall code
	syscall			# prints Celcius val
	
	li	$v0, 10		# exit syscall code
	syscall
	