//
// Created by os on 8/13/24.
//

#include "../h/memoryallocator.hpp"
#include "../lib/hw.h"

namespace Kernel {
    MemoryAllocator::BlkHeader *MemoryAllocator::freeHead = nullptr;

    void MemoryAllocator::init() {
        size_t startAddr = (size_t) HEAP_START_ADDR;

        if(size_t rest = startAddr % MEM_BLOCK_SIZE)
            startAddr += MEM_BLOCK_SIZE - rest;

        size_t endAddr = (size_t) HEAP_END_ADDR;
        endAddr -= endAddr % MEM_BLOCK_SIZE;

        freeHead = (BlkHeader *) startAddr;
        freeHead->size = (endAddr - startAddr)/MEM_BLOCK_SIZE; //number of blocks
        freeHead->next = nullptr;
    }

    void* MemoryAllocator::__mem__alloc(size_t sz) { //first fit, sz je u B prebaciti u blokove

        BlkHeader *curr = freeHead, *prev = nullptr;

        for (; curr && curr->size < sz; prev = curr, curr = curr->next);

        if (!curr) return nullptr;
        size_t remaining = curr->size - sz;

        if (remaining > 0) {
            curr->size = sz;
            BlkHeader *newBlk = (BlkHeader *)((size_t)curr +MEM_BLOCK_SIZE*sz);
            if (prev) prev->next = newBlk;
            else freeHead = newBlk;

            newBlk->size = remaining;
            newBlk->next = curr->next;
        } else {
            if (prev)prev->next = curr->next;
            else freeHead = curr->next;
        }

        curr->next = nullptr;
        return ++curr;
        // //da li sz prelazi preko dozvoljenog broja blokova
        // if (sz<=0) return nullptr;
        //
        // BlkHeader *curr = freeHead, *prev=nullptr;
        // for(; curr!=nullptr && curr->size < sz; prev = curr, curr = curr->next);
        //
        // if (curr==nullptr) return nullptr;
        //
        // size_t newSize = curr->size - sz;
        //
        // //2 situacije: ima slobodnih blokova iza ili ih nema
        // if(newSize>0) {
        //     curr->size = sz;
        //     BlkHeader *newBlk = (BlkHeader*)(sz*MEM_BLOCK_SIZE+(size_t)curr);
        //
        //     if (prev) prev->next = newBlk;
        //     else freeHead = newBlk;
        //     newBlk->next = curr->next;
        //     newBlk->size = newSize;
        // } else {
        //
        //     if (prev) prev->next = curr->next;
        //     else freeHead = curr->next;
        //
        // }
        // curr->next = nullptr;
        //
        // return ++curr;

    }

    int MemoryAllocator::__mem__free(void *addr) {

        if (!addr) return -1;

        auto *target = (BlkHeader *)((size_t) addr - sizeof(BlkHeader));

        BlkHeader *curr = freeHead, *prev = nullptr;

        for (; target > curr && curr; prev = curr, curr = curr->next);

        target->next = curr;

        if ((size_t)target + target->size*MEM_BLOCK_SIZE == (size_t)curr && curr) {
            target->size += curr->size;
            target->next = curr->next;
        }
        if (prev) {
            prev->next = target;
            if ((size_t)prev + prev->size*MEM_BLOCK_SIZE == (size_t)target) {
                prev->size += target->size;
                prev->next = target->next;
            }
        } else {
            freeHead = target;
        }
        return 0;
    }


}

