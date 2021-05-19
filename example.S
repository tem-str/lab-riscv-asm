.data
N:
.word 4
M:
.word 2
matrix:
.word  1, 2, 1, -2
.word -2, 2, 5, -3
result:
.word 0

.text

main:
la a2, N
lw t1, 0(a2) #N
la a3, M
lw t2, 0(a3) #M
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit


print:
lw t1, 0(a2)
lw a1, 0(a3)
addi t2, x0, 0
ret

exit:
addi a0,x0,10
ecall

process:
addi t4, x0, 0 # row now

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # colum now

cycle:
lw a7, 0(a4) # load value from arrayw
call positive
addi a4, a4, 4 # increment array pointer
add t5, t5, a7 # count sum
addi t3, t3, 1
blt t3, t1, cycle
sw t5, 0(a5) # save result to resulting array
addi a5, a5, 4
addi t4, t4, 1
blt t4, t2, init
ret


positive: #  check sing
addi t6, a7, 0 # load arg
bgtz t6, ans
addi t6, x0, 0
ans:
addi a1, t6, 0
ret
