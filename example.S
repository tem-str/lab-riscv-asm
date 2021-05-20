.data
N:
.word 4
M:
.word 2
matrix:
.word 1, 4, 1, 2
.word 1, 2, -2, -3

result:
.word 0

.text

main:
la a2, N
lw a2, 0(a2) # N
la a3, M
lw a3, 0(a3) # M

la a4, matrix
la a5, result

call process
la a2, M
la a3, result
call print
call exit

print:
lw t1, 0(a2)
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

ret

exit:
addi a0, x0, 10
ecall

process:
add t1, a2, x0 # t1 = N
add t2, a3, x0 # t2 = M

check_sing:
beq t4, x0, check_end
addi t4,t4,-1
addi t3, x0, 0 # row element number

inc_sing:
addi a4, a4, 4 
addi t3, t3, 1 
blt t3, t1, inc_sing 
j check_sing
check_end:

addi t4, x0, 0 # row pointer

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
add t5, t5, t6 # count sum
addi t3, t3, 1
blt t3, t1, cycle
bgtz t5,ans
ret
ans:
sw t5, 0(a5) # save result 
ret
