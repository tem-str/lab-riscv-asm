.data
N:
.word 4
M:
.word 2
matrix:
.word 1, 4, 2, 1
.word 1, 2, -2, -3
result:
.word 0
.word 0
.word 0
.word 0

.text

main:
la a2, N
lw a2, 0(a2)
la a3, M
lw a3, 0(a3)
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit

print:
lw t1, 0(a2)

addi t2, x0, 0
print_cycle:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

addi t2, t2, 1
addi a3, a3, 4
blt t2, t1, print_cycle
ret

exit:
addi a0, x0, 10
ecall

process:
add t1, a2, x0 # t1 = a2 = N
add t2, a3, x0 # t2 = a3 = M
addi t4, x0, 0 # row pointer

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
blt t6, x0, skip # if t0 < t1 then target
add t5, t5, t6 # count sum
skip:
addi t3, t3, 1
blt t3, t1, cycle
sw t5, 0(a5) # save result to resulting array
addi a5, a5, 4
addi t4, t4, 1
blt t4, t2, init
ret
