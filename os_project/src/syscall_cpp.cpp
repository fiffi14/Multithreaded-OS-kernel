//
// Created by os on 9/4/24.
//

#include "../h/syscall_cpp.hpp"

void* operator new (size_t size) {
    return mem_alloc(size);
}

void operator delete (void* addr) {
    mem_free(addr);
}

Thread::Thread(void (*body)(void*), void* arg) {

    this->body = body;
    this->arg = arg;

}

int Thread::start() {
    return thread_create(&myHandle, this->body, this->arg);
}

Thread::Thread() {
    this->arg = this;
    this->body = [](void* arg) -> void {
        auto thread = (Thread *)arg;
        thread->run();
    };
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {
    return 0;
}

Thread::~Thread() = default;

Semaphore::Semaphore(unsigned init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore () {
    sem_close(myHandle);
}

int Semaphore::wait () {
    return sem_wait(myHandle);
}

int Semaphore::signal () {
    return sem_signal(myHandle);
}

int Semaphore::timedWait (time_t) {
    return 0;
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
