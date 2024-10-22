.data
    array:  .word 14, 11, 8, 19, 1
    n:      .word 5
    before: .asciiz "Before Sorting "
    after:  .asciiz "After Sorting "
    space: "\n"
.text
.globl main

main:
    la $t0, array
    lw $t1, n
    li $v0, 4
    la $a0, before
    syscall
    move $t2, $t1
    
before_loop:
    beq $t2, $zero, sort
    lw $t3, 0($t0)
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t0, $t0, 4
    subi $t2, $t2, 1
    j before_loop

sort:
    la $t0, array
    lw $t1, n

outer_loop:
    li $t4, 0
    subi $t1, $t1, 1
    beq $t1, $zero, p_after
    la $t0, array
    lw $t5, n
    subi $t5, $t5, 1

inner_loop:
    lw $t6, 0($t0)
    lw $t7, 4($t0)
    
    blt $t6, $t7, skip_swap
    sw $t7, 0($t0)
    sw $t6, 4($t0)
    li $t4, 1

skip_swap:
    addi $t0, $t0, 4 
    subi $t5, $t5, 1
    bgtz $t5, inner_loop

    beq $t4, $zero, p_after
    j outer_loop

p_after:
    li $v0, 4
    la $a0, after
    syscall

    la $t0, array
    lw $t2, n
after_loop:
    beq $t2, $zero, end
    lw $t3, 0($t0)
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t0, $t0, 4
    subi $t2, $t2, 1
    j after_loop

end:
    li $v0, 10
    syscall
