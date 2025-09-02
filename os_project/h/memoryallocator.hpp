//
// Created by os on 8/13/24.
//

#ifndef MEMORYALLOCATOR_HPP
#define MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

namespace Kernel {

class MemoryAllocator {
     public:
     //MemoryAllocator(){}

         static void init();
         static void* __mem__alloc(size_t sz);
         static int __mem__free(void *addr);

         struct BlkHeader {
              size_t size;
              BlkHeader *next;
         };

     private:
        static BlkHeader *freeHead; //od pocetka bloka mem, dakle za prvom adresom sto je BlkHeader
};

} // Kernel

#endif //MEMORYALLOCATOR_HPP
