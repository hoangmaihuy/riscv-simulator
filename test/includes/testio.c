//
// Created by Mai Hoàng on 16/10/2021.
//

#include "testio.h"

// Syscall number in /src/simulator/syscall.cpp

int getint() {
  int x;
  asm("li a7, 10;"
      "ecall");
  asm("addi %0, a0, 0" : "=r" (x));
  return x;
}

long long read_long_long() {
  long long x;
  asm("li a7, 11;"
      "ecall");
  asm("addi %0, a0, 0" : "=r" (x));
  return x;
}

char getch() {
  char x;
  asm("li a7, 12;"
      "ecall");
  asm("addi %0, a0, 0" : "=r" (x));
  return x;
}

void putint(int x) {
  asm("li a7, 20;"
      "ecall");
}

void write_long_long(long long x) {
  asm("li a7, 21;"
      "ecall");
}

void putch(char ch) {
  asm("li a7, 22;"
      "ecall");
}

void write_string(char *buf) {
  asm("li a7, 23;"
      "ecall");
}
