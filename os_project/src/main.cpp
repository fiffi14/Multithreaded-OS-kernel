
#include "../h/memoryallocator.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"
#include "../h/syscall_c.h"
#include "../h/tcb.hpp"
#include "../test/printing.hpp"

//AKO JE MULTIPLE DEF OF USERMAIN SKLONI INCLUDE TOG CPP FAJLA
using namespace Kernel;

void userMain();
int guard = 0;

void userMainWr(void*) {
    userMain();
    guard = 1;
}

void main() {
    MemoryAllocator::init();

    Riscv::w_stvec((uint64) &Riscv::intpRoutine);
    TCB *mainTCB = TCB::createThread(nullptr,nullptr,nullptr);
    TCB::running = mainTCB;

    uint64 *sp = (uint64*)MemoryAllocator::__mem__alloc(DEFAULT_STACK_SIZE);
    TCB::createThread(userMainWr,nullptr,sp);


    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


    while(!guard) {
        thread_dispatch();
    }
    //delete mainTCB;
    printString("main gotov\n");


    // printString("created main thread\n");
    // TCB *threads[2];
    // uint64* sp = (uint64*) MemoryAllocator::__mem__alloc(Riscv::roundToBlks(DEFAULT_STACK_SIZE));
    // threads[0] = TCB::createThread(workerBodyA,nullptr, sp);
    // printString("A created\n");
    // uint64* sp2 = (uint64*) MemoryAllocator::__mem__alloc(Riscv::roundToBlks(DEFAULT_STACK_SIZE));
    // threads[1] = TCB::createThread(workerBodyB,nullptr, sp2);
    // printString("B created\n");
    //
    // // printString("while loop\n");
    // while(!(threads[0]->isFinished() && threads[1]->isFinished())) {
    //
    //     thread_dispatch();
    //
    //
    // }
    // while(!threads[0]->isFinished()) {
    //     //printString("while");
    //     TCB::dispatch();
    // }
    //MemoryAllocator::__mem__free(mainTCB);
    //
    // delete mainTCB;
    // delete threads[0];
    // delete threads[1];
    // //delete threads;
    // printString("finished\n");




    //Riscv::syscall(4);
    //__putc('\n'); __putc('f'); __putc('\n');
    // int *arr;
    // arr = (int*) mem_alloc(125);
    //
    // for(int i=1;i<6;i++) {
    //     arr[i] = i;
    // }
/*
    int *arr2;
    arr2 = (int*) mem_alloc(49);
    for(int i=1;i<6;i++) {
        arr2[i] = i;
    }*/
    //MemoryAllocator::__mem__free(arr);
    //mem_free(arr);
    /*if(a<0) {
        __putc('-'); __putc('\n');
    } else {
        __putc('+'); __putc('\n');
    }*/
}