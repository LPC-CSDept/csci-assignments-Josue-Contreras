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
        lw	$t1, 0($t1)             # Load from reciever control register      
        andi	$t1, $t1, 1             # Clear all bits of except for LSB
        beqz    $t1, rd_wait            # If not ready(0), restart, otherwise(1) continue to calculation
        lw      $t2, 4($t1)             # Read data from reciever data to $t2
output: 
        