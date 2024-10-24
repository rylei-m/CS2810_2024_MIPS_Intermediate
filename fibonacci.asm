.data
    prompt: .asciiz "Enter A Number: "
    newline: .asciiz "\n"
    done: .asciiz "\n"
    too_big: .asciiz "Input Too Big. Range is 0-46 \n"

.text
    .globl main

main:
    # input
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    # if 0 end
    blez $t0, exit_program

    # fib 0 and 1
    li $t1, 0
    li $t2, 1
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    # if n = 1 exit
    beq $t0, 1, exit_program

    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # if n = 2 exit
    beq $t0, 2, exit_program

    # 2 loop
    li $t3, 2

    # error handling
    # input maximum
    li $t5, 46
    ble $t0, $t5, fibanacciLoop
    li $v0, 4
    la $a0, too_big
    syscall

    li $v0, 10
    syscall

fibanacciLoop:
    # i = i-1 + i-2
    add $t4, $t1, $t2

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    move $t1, $t2
    move $t2, $t4

    addi $t3, $t3, 1

    # if i < n cont
    blt $t3, $t0, fibanacciLoop

exit_program:
    li $v0, 4
    la $a0, done
    syscall

    li $v0, 10
    syscall
