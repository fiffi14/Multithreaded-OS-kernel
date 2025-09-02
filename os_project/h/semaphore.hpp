//
// Created by os on 8/29/24.
//

#ifndef SEMAPHORE_HPP
#define SEMAPHORE_HPP
#include "list.hpp"
#include "tcb.hpp"


namespace Kernel {

class Semaphore {


public:
    Semaphore(unsigned val=0):   blockedQ(), closed(false), value(val) {}
    ~Semaphore();

    int getValue() { return value; }

    List<TCB> blockedQ;

    int wait();
    int signal();
    int close();
    int tryWait();

    static Semaphore *open(unsigned init);

    void *operator new(uint64 s);
    void *operator new[](uint64 s);
    void operator delete(void *p) noexcept;
    void operator delete[](void *p) noexcept;

protected:
	void block();
    void deblock();
private:

    volatile bool closed;
    volatile int value;
    friend class Riscv;


};

} // Kernel

#endif //SEMAPHORE_HPP
