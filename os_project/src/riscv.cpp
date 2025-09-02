//
// Created by os on 8/19/24.
//

#include "../h/riscv.hpp"

#include "../h/memoryallocator.hpp"
#include "../h/scheduler.hpp"
#include "../test/printing.hpp"
#include "../h/semaphore.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../lib/hw.h"

using namespace Kernel;

void Riscv::popSppSpie() {
    mc_sstatus(SSTATUS_SPP);
    __asm__ volatile ("csrw sepc, ra"); //upisati povr adresu u odn na trenutak skoka u prk rutinu
        //zato ne sme biti inline
    __asm__ volatile ("sret"); //DA SE IZADJE IZ THR_WRAP
}


// argmuneti se prenose preko regs a0,a1,a2,a3,a4 pa se ne moraju upisivati arg u iste u sis pozivu
uint64 Riscv::intpHandle(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    volatile uint64 scause = Riscv::r_scause(); //LOKALNE PROM A ONE IDU UVEK NA STEK
    volatile uint64 sepc = Riscv::r_sepc(); //EKVIVALENT PUSH
    volatile uint64 sstatus = Riscv::r_sstatus();
    volatile uint64 retVal = 0;

    if(scause == (1UL << 63 | 1UL)) {
        //softverski prekid tajmera

        // TCB::cntTimeSlice++;
        // if(TCB::cntTimeSlice >= TCB::running->getTimeSlice()) {
        //     TCB::cntTimeSlice = 0;
        //     TCB::dispatch();
        // }

        mc_sip(Riscv::SIP_SSIP); //softverski prekid se obradio

    } else if(scause == 8UL || scause == 9UL) { // 9 sustinski dozvoljava ugnjezdavanja; time kernelske new i delete ne moram da pravim

        switch (code) {
            case 0x1: { // mem_alloc
                retVal = (uint64) MemoryAllocator::__mem__alloc(arg1);
                break;
            }
            case 0x2: { // mem_free
                retVal = MemoryAllocator::__mem__free((void *)arg1);
                break;
            }
            case 0x11: { // thread_create
                TCB **handle = (TCB**) arg1;
                *handle = TCB::createThread((void (*)(void *)) arg2,(void *) arg3, (uint64*)arg4);

                if(*handle!=nullptr) {
                    retVal = 0;
                } else {
                    retVal = -1;
                }
                //TCB::dispatch();
                //Scheduler::put(*handle);
                break;
            }
            case 0x12: { // thread_exit
                TCB::running->setFinished(true);
                TCB::dispatch();
                break;
            }
            case 0x13: { // thread_dispatch
                TCB::dispatch();
                break;
            }
            case 0x21: { // sem_open
                Semaphore **handle = (Semaphore**) arg1;
                *handle = Semaphore::open((uint64)arg2);
                if(*handle!=nullptr) {
                    retVal = 0;
                } else {
                    retVal = -1;
                }
                break;
            }
            case 0x22: { // sem_close
                Semaphore *sem = (Semaphore*) arg1;
                retVal = sem->close();
                break;
            }
            case 0x23: { // sem_wait
                Semaphore *sem = (Semaphore*) arg1;
                retVal = sem->wait();
                break;
            }
            case 0x24: { // sem_signal
                Semaphore *sem = (Semaphore*) arg1;
                retVal = sem->signal();
                break;
            }
            case 0x26: { // sem_tryWait
                Semaphore *sem = (Semaphore*) arg1;
                retVal = sem->tryWait();
                break;
            }

            case 0x41: { // getc
                retVal = (uint64) __getc();
                break;
            }
            case 0x42: { // putc
                __putc(arg1);
                break;
            }
            default: {
                printString("default\n");
                break;
            }
        }

        sepc += 4; //da bismo otisli na narednu instrukciju nakon ecall po povr iz rutine

    } else if(scause == (1UL << 63 | 9UL)) {
        console_handler();
    } else {
        //print sepc i scause sa onim fajlom sa timsa
        printString("scause: ");
        printInt(scause, 16);
        __putc('\n');
        printString("sepc: ");
        printInt(sepc,16);
        __putc('\n');
        while(1);

    }

    w_sstatus(sstatus);
    w_sepc(sepc);
    w_scause(scause); // njihov getc menja celu rutinu i da se ne izgubi info
    return retVal;
}