//
// Created by os on 8/22/24.
//

#include "../h/tcb.hpp"
#include "../h/syscall_c.h"
#include "../h/memoryallocator.hpp"
#include "../h/scheduler.hpp"

namespace Kernel { //DA LI DOZVOLITI SIE ZA PREKIDE u superv rezimu

    TCB *TCB::running = nullptr;
    TCB *TCB::oldRunning = nullptr;
    int TCB::cntActiveT = 1;
    //int TCB::cntTimeSlice = 0;

    TCB::TCB(Body b, void *arg, uint64 *stack) :
        body(b),
        arg(arg),
        stack(stack),
        context({
         (uint64) &thrWrapper,
         stack != nullptr? (uint64) &stack[DEFAULT_STACK_SIZE]:0
        }),
        finished(false),
        blocked(false)

    {
        if(b!=nullptr) {
            Sstack = (uint64*) MemoryAllocator::__mem__alloc(Riscv::roundToBlks(DEFAULT_STACK_SIZE));
            cntActiveT++;
            Scheduler::put(this);
        }
    }
    TCB::~TCB() {
        if(body) cntActiveT--;
        MemoryAllocator::__mem__free(stack);
        MemoryAllocator::__mem__free(Sstack); //izbegavanje ugnz sis poziva
    }




    void TCB::yield(TCB *oldT, TCB *newT) { //sinhrono
        //if (oldT == nullptr || newT == nullptr) return;
        Riscv::pushRegs();
        switchContext(&oldT->context, &newT->context);
        Riscv::popRegs();
        // if(oldRunning->isFinished()) { // mora oldR jer oldT je neki praistorijski parm u odnosu na newT
        //     delete oldRunning;
        // }
    }

    void TCB::dispatch() {
        TCB *oldR = running;
        if(!oldR->isFinished() && !oldR->isBlocked()) {
            Scheduler::put(oldR);
        }
        running = Scheduler::get();

        if(oldR!=running) {
            yield(oldR, running);
        }

    }

    void TCB::thrWrapper() {
        Riscv::popSppSpie(); //popovanje sadrzaja sstatus registra zbog promene privilegije
        running->body(running->arg); //za sve niti ce ovo raditi kada krecu, pa mora kroz running
        running->setFinished(true);
        thread_exit();
    }


    TCB *TCB::createThread(Body body, void *arg, uint64 *stack) {
        return new TCB(body, arg, stack);
    }


    void *TCB::operator new(uint64 s) {
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    }

    void *TCB::operator new [](uint64 s) {
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    }

    void TCB::operator delete(void *p) noexcept {
        MemoryAllocator::__mem__free(p);
    }

    void TCB::operator delete [](void *p) noexcept {
        MemoryAllocator::__mem__free(p);
    }

    uint64 TCB::superSP(uint64 sp) {
        if((Riscv::r_sstatus() & Riscv::SSTATUS_SPP)==0) { //ako smo presli na neki sistemski stek, pa makar bio ugnz poziv
            running->savedSP = sp;
            return ((uint64) &(running->Sstack[DEFAULT_STACK_SIZE]));
        } else {
            return sp;
        }

    }

    uint64 TCB::userSP(uint64 sp) {
        if((Riscv::r_sstatus() & Riscv::SSTATUS_SPP)==0) {
            return running->savedSP; // sacuvani korisnicki
        } else
            return sp;
    }


} // Kernel