.extern _ZN6Kernel3TCB7superSPEm
.extern _ZN6Kernel3TCB6userSPEm

.extern _ZN5Riscv10intpHandleEmmmmm

.global _ZN5Riscv11intpRoutineEv
.type _ZN5Riscv11intpRoutineEv, @function
.align 4
_ZN5Riscv11intpRoutineEv:
push:
    addi sp,sp,-256
    .irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp) # x2 - sp; automatski ce se restaurirati
    .endr

    mv a0, sp #argument
    call _ZN6Kernel3TCB7superSPEm
    mv t0, a0
    ld a0, 80(sp) # kod sistemskog poziva
    mv sp, t0 // povr vrednost, sp, novog sistemskog steka ili istog pri ugnz

    call _ZN5Riscv10intpHandleEmmmmm

    mv t0, a0
    mv a0, sp
    call _ZN6Kernel3TCB6userSPEm
    mv sp, a0 // vratiti se na korisnicki
    mv a0, t0 // povr vrednost intpHandler


    csrr t0, scause #ova provera nece biti kod getc zbog onog u riscv.cpp
    addi t0, t0, -0x8
    beqz t0, pop
    addi t0, t0, -0x1
    beqz t0, pop
    ld a0, 80(sp) #pop i a0 posto nije bio ecall

pop:
    .irp index, 1,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp) #x10 - a0, x2 - sp
    .endr
    addi sp,sp,256

    sret


.global _ZN5Riscv7syscallEmmmmm
.type _ZN5Riscv7syscallEmmmmm, @function
_ZN5Riscv7syscallEmmmmm:
    ecall
    ret #samo je obicna fja



.global _ZN5Riscv8pushRegsEv #vec cuvao ra i sp, sto su x1 i x2
.type _ZN5Riscv8pushRegsEv, @function
_ZN5Riscv8pushRegsEv:
    addi sp, sp, -256
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    ret

.global _ZN5Riscv7popRegsEv
.type _ZN5Riscv7popRegsEv, @function
_ZN5Riscv7popRegsEv:
    .irp index 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    ret