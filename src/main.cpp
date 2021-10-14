#include <iostream>
#include <getopt.h>
#include "global.hpp"
#include "simulator/simulator.hpp"

bool verbose = false;

void printUsage()
{
  printf("Usage: ./riscv-simulator [-v] <elf-path>\n");
  printf("Options: \n");
  printf("  -v    Verbose mode\n");
}

int main(int argc, char *argv[])
{

  int opt;
  char *elfPath;

  /* Parse arguments */
  while ((opt = getopt(argc, argv, ":vh")) != -1)
  {
    switch (opt)
    {
      case 'h':
        printUsage();
        return 0;
      case 'v':
        verbose = true;
        break;
      case '?':
        printf("Unknown option: %c\n", optopt);
        break;
      default:
        break;
    }
  }

  /* Read ELF */
  elfPath = argv[optind];
  auto simulator = new Simulator();
  simulator->loadMemoryFromElf(elfPath);
}
