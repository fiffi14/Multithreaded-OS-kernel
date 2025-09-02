//
// Created by os on 8/22/24.
//

#ifndef SCHEDULER_HPP
#define SCHEDULER_HPP
#include "list.hpp"
#include "tcb.hpp"


namespace Kernel {

class Scheduler {
private:
  static List<TCB> readyQ;
public:
  static TCB *get();
  static void put(TCB *t);


};

} // Kernel

#endif //SCHEDULER_HPP
