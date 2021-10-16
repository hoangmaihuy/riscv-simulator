//
// Created by Mai Hoàng on 16/10/2021.
//

#include "simulator.hpp"

#define SYS_read 63
#define SYS_write 64
#define SYS_exit 93

void Simulator::syscall()
{
  auto sysnum = cpu->get_reg(reg("a7"));
  switch (sysnum)
  {
    case SYS_exit:
      exit_code = cpu->get_reg(reg("a0"));
      fprintf(stderr, "Program terminated with exit code %d\n", exit_code);
      exit(0);
    case SYS_read:
      break;
    case SYS_write:
      break;
    default:
      fprintf(stderr, "Unhandled system call: %lld\n", sysnum);
      exit(1);
  }

}
