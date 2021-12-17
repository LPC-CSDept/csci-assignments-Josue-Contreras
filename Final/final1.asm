#       final1.asm
# 
#       Josue Contreras 
#       12-17-2021
#
#       Read 3 digits using MM I/O
#       Create an int from those values and print it out
        .data
txt1:   .asciiz "Enter 3 numbers.\n"
txt2:   .asciiz "The number: "

        .text
        .globl main
main:
        li      $t0, 100        # Multiplier $t0 = 100

        li      $v0, 4          # Print syscall code
        la	$a0, txt1       # Address of "txt1"
        syscall                 # Prints "txt1"

        
        