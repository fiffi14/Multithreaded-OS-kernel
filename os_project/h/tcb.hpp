//
// Created by os on 8/22/24.
//

#ifndef TCB_HPP
#define TCB_HPP

#include "../lib/hw.h"

#include "../h/riscv.hpp"
namespace Kernel {

class TCB {
public:
  using Body = void (*)(void *);
  TCB(Body b, void *arg, uint64 *stack);
  ~TCB();

  bool isFinished() const { return finished; }
  void setFinished(bool b) { finished = b; }

  static int getCntActiveT() { return cntActiveT; }

  //uint64 getTimeSlice() const { return timeSlice; }

  static TCB *running;
  static TCB *oldRunning;


  static void yield(TCB *oldT, TCB *newT);
  static void dispatch();

  static TCB *createThread(Body body, void *arg, uint64 *stack); //*

  bool isBlocked() const { return blocked; }
  void setBlocked(bool b) { blocked = b; }


  static uint64 userSP(uint64 sp); //prelazak na user i sistemski stek
  static uint64 superSP(uint64 sp);


  void *operator new(uint64 s);
  void *operator new[](uint64 s);
  void operator delete(void *p) noexcept;
  void operator delete[](void *p) noexcept;

private:

  struct Context {
	  uint64 ra;
    uint64 sp;
  };
  Body body;
  void *arg;
  uint64 *stack; //korisnicki stek niti
  Context context;
  bool finished;

  uint64 *Sstack; //sistemski stek niti
  uint64 savedSP;

  bool blocked;

  static void thrWrapper(); //*
  static void switchContext(Context *oldc, Context *newc);

  // uint64 timeSlice = DEFAULT_TIME_SLICE;
  // static int cntTimeSlice;

  static int cntActiveT;
  friend class Riscv;
  friend class Semaphore;


};

} // Kernel

#endif //TCB_HPP
