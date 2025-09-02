//
// Created by os on 8/21/24.
//

#include "../h/syscall_c.h"
#include "../h/riscv.hpp"
#include "../lib/hw.h"

void *mem_alloc(size_t size) {
    size = Riscv::roundToBlks(size);
    return (void *)Riscv::syscall(0x1, size);
}

int mem_free(void *addr) {
    return (int) Riscv::syscall(0x2, (uint64) addr);
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    void *stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    return Riscv::syscall(0x11, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
}

int thread_exit() {
    Riscv::syscall(0x12);
    return 0;

}

void thread_dispatch() {
    Riscv::syscall(0x13);
}

int sem_open(sem_t *handle, unsigned init) {
    return Riscv::syscall(0x21, (uint64) handle, (uint64) init);
}

int sem_close(sem_t handle) {
    return Riscv::syscall(0x22, (uint64) handle);
}

int sem_wait(sem_t id) {
    return Riscv::syscall(0x23, (uint64) id);
}

int sem_signal(sem_t id) {
    return Riscv::syscall(0x24, (uint64) id);
}

int sem_trywait(sem_t id) {
    return Riscv::syscall(0x26, (uint64) id);
}

void putc(char c) {
    Riscv::syscall(0x42, c);
}

char getc() {
    return Riscv::syscall(0x41);
}

