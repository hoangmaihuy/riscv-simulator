//
// Created by Mai Hoàng on 16/10/2021.
//

#include "simulator.hpp"
#include <unistd.h>
#include <stdio.h>

#define SYS_read_int 10
#define SYS_read_long_long 11
#define SYS_read_char 12
#define SYS_write_int 20
#define SYS_write_long_long 21
#define SYS_write_char 22
#define SYS_write_string 23
#define SYS_exit 93

int64_t Simulator::syscall(int64_t sysnum, int64_t argument) {
  int x;
  long long y;
  char ch;
  uint64_t addr;

  switch (sysnum) {
    case SYS_exit:
      exit_code = argument;
      exited = true;
      if (verbose)
        fprintf(stderr, "\nProgram terminated with exit code %d\n", exit_code);
      break;
    case SYS_read_int:
      scanf("%d", &x);
      return x;
    case SYS_read_long_long:
      scanf("%lld", &y);
      return y;
    case SYS_read_char:
      scanf("%c", &ch);
      return ch;
    case SYS_write_int:
      x = argument;
      printf("%d", x);
      break;
    case SYS_write_long_long:
      y = argument;
      printf("%lld", y);
      break;
    case SYS_write_char:
      ch = argument;
      printf("%c", ch);
      break;
    case SYS_write_string:
      addr = argument;
      while (true) {
        ch = (char) memory->read(addr, 1);
        if (!ch) break;
        printf("%c", ch);
        addr++;
      }
      break;
    default:
      fprintf(stderr, "Unhandled system call: %lld\n", sysnum);
      exit(1);
  }
  return 0;
}
