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
        li      $t0, 100                # Multiplier $t0 = 100

        li      $v0, 4                  # Print syscall code
        la	$a0, txt1               # Address of "txt1"
        syscall                         # Prints "txt1"

        lui     $t1, 0xFFFF             # Memory location (Reciever Control) $t1 = 0xFFFF
rd_wait:
        lw	$t4, 0($t1)             # Load from reciever control register      
        andi	$t4, $t4, 1             # Clear all bits of except for LSB
        beqz    $t4, rd_wait            # If not ready(0), restart, otherwise(1) continue to calculation
        lw      $t2, 4($t1)             # Read data from reciever data to $t2

        sub	$t2, $t2, 48            # Subtract $t2 by 48 convert from ASCII to int 
        mul	$t2, $t2, $t0            # Multiply $t2 but the multiplyer from $t0
        div	$t0, $t0, 10	        # Divide $t0 to decrease place value
        add	$t3, $t3, $t2           # Add current digit values

        bnez    $t0, rd_wait            # if not on the last place (0) poll for next digit

        la      $a0, txt2               # Address of the exit number prompt
        syscall                         # Print message

        move    $a0, $t3                # Move output to argument register 
        li      $v0, 1                  # Print int syscall code
        syscall                         # Print int 

        li      $v0, 10                 # Exit syscall code
        syscall