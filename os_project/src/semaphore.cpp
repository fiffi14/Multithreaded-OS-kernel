//
// Created by os on 8/29/24.
//

#include "../h/semaphore.hpp"
#include "../h/scheduler.hpp"
#include "../test/printing.hpp"


namespace Kernel {



    // void Semaphore::block() {
    //     return;
    //     // cntBlockedThreads++;
    //     //
    //     // //printString("block: "); printInt(cntBlockedThreads,10,1); printString("\n");
    //     // blockedQ.addLast(TCB::running);
    //     // TCB::oldRunning = TCB::running;
    //     // // if(!oldT->isFinished()) {
    //     // //     Scheduler::put(oldT);
    //     // // }
    //     // TCB::running = Scheduler::get();
    //     // TCB::yield(TCB::oldRunning, TCB::running);
    //     // //printString("out block\n");
    // }
    //
    // void Semaphore::deblock() {
    //     // if (blockedQ.peekFirst()) {
    //     //     TCB *fifu = blockedQ.removeFirst();
    //     //     cntBlockedThreads--;
    //     //     //printString("deblock: "); printInt(cntBlockedThreads,10,1); printString("\n");
    //     //
    //     //     Scheduler::put(fifu);
    //     // }
    //     //printString("out deblock\n");
    // }



    void *Semaphore::operator new(uint64 s) {
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    }

    void *Semaphore::operator new [](uint64 s) {
        return MemoryAllocator::__mem__alloc(Riscv::roundToBlks(s));
    }

    void Semaphore::operator delete(void *p) noexcept {
        MemoryAllocator::__mem__free(p);
    }

    void Semaphore::operator delete [](void *p) noexcept {
        MemoryAllocator::__mem__free(p);
    }

    Semaphore *Semaphore::open(unsigned init) {
            return new Semaphore(init);
    }

    int Semaphore::close() {
        if(closed) return -1;
        TCB *tmp;
        while((tmp=blockedQ.removeFirst())!=nullptr) {
            tmp->setBlocked(false);
            Scheduler::put(tmp);
        }
        closed=true;
        return 0;
    }

    int Semaphore::wait() {
        if(closed) return -1;
        if (--value < 0) {
            //printString("wait: "); printInt(value,10,1); printString("\n");
            blockedQ.addLast(TCB::running);
            TCB::running->setBlocked(true);
            TCB::dispatch();

        }
        return 0;

    }

    int Semaphore::signal() {
        if (closed) return -1;
        //printString("signal: "); printInt(value,10,1); printString("\n");
        if(++value<=0) {
            TCB* fifu = blockedQ.removeFirst();
            //if(!fifu) return -1;
            fifu->setBlocked(false);
            Scheduler::put(fifu);
        }

        return 0;
    }

    int Semaphore::tryWait() {
        if(closed) return 0;
        if(value>0) {
            value--;
            return 1;
        }
        return -1;
    }



} // Kernel