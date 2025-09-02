//
// Created by os on 8/22/24.
//

#include "../h/scheduler.hpp"
#include "../h/list.hpp"
#include "../h/tcb.hpp"

namespace Kernel {
    List<TCB> Scheduler::readyQ;

    TCB *Scheduler::get() {
        return readyQ.removeFirst();

    }
    void Scheduler::put(TCB *t) {
        readyQ.addLast(t);

    }



} // Kernel