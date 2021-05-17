.data
N:
.word 4
M:
.word 2
matrix:
.word 2, -1, 3, 0
.word -3, 1, 1, -2
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
sw a1, 0(a5)
call exit

exit:
addi a0, x0, 10
ecall

process:
addi s1, ra, 0
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

cycle:
lw a7, 0(a4) # load value from array
call positive
addi a4, a4, 4 # increment array pointer
add t5, t5, a1 # count sum
addi t3, t3, 1
blt t3, a2, cycle
sw t5, 0(a5) # save result to resulting array
addi a5, a5, 4
addi t4, t4, 1
blt t4, a3, init
addi a1, t5, 0
addi ra, s1, 0
ret


positive: # check sign   
addi t6, a7, 0 # load argument
bgtz t6, ans
addi t6, x0, 0
ans:
addi a1, t6, 0
ret


print: 
lw t1, 0 (a2)