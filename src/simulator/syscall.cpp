//
// Created by Mai Hoàng on 16/10/2021.
//

#include "simulator.hpp"
#include <unistd.h>

#define SYS_read 63
#define SYS_write 64
#define SYS_exit 93

void Simulator::syscall()
{
  auto sysnum = cpu->get_reg(reg("a7"));
  int fd;
  uint64_t addr;
  uint64_t size;
  char* buf;
  switch (sysnum)
  {
    case SYS_exit:
      exit_code = cpu->get_reg(reg("a0"));
      fprintf(stderr, "\nProgram terminated with exit code %d\n", exit_code);
      exit(0);
    case SYS_read:
      fd = cpu->get_reg(reg("a0"));
      addr = cpu->get_reg(reg("a1"));
      size = cpu->get_reg(reg("a2"));
      buf = static_cast<char *>(malloc(size));
      read(fd, buf, size);
      memory->write(addr, size, buf);
      free(buf);
      break;
    case SYS_write:
      fd = cpu->get_reg(reg("a0"));
      addr = cpu->get_reg(reg("a1"));
      size = cpu->get_reg(reg("a2"));
      buf = static_cast<char *>(malloc(size));
      memory->read(addr, size, buf);
      write(fd, buf, size);
      free(buf);
      break;
    default:
      fprintf(stderr, "Unhandled system call: %lld\n", sysnum);
      exit(1);
  }

}
