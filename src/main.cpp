#include <iostream>
#include <getopt.h>
#include "global.hpp"
#include "simulator/simulator.hpp"

bool verbose = false;
bool debug_mode = false;

void print_usage() {
  printf("Usage: ./riscv-simulator [options] <elf-path>\n");
  printf("Options: \n");
  printf("  -h              Print this message\n");
  printf("  -v              Verbose mode\n");
  printf("  -d              Debug mode\n");
  printf("Debug: \n");
  printf("  r               Run till end\n");
  printf("  n               Next cycle\n");
  printf("  c               Run till breakpoint\n");
  printf("  b               Set current instruction as breakpoint\n");
  printf("  bi <address>    Set instruction at <address> as breakpoint\n");
  printf("  bs <symbol>     Set symbol as breakpoint\n");
  printf("  wr a            Watch all register values\n");
  printf("  wr <reg>        Watch register <reg> value\n");
  printf("  wmb <address>   Watch 1 byte memory (byte) at <address>\n");
  printf("  wmh <address>   Watch 2 bytes memory (half) at <address>\n");
  printf("  wmw <address>   Watch 4 bytes memory (word) at <address>\n");
  printf("  wmd <address>   Watch 8 bytes memory (double) at <address>\n");
}

int main(int argc, char *argv[]) {

  int opt;
  char *elfPath;

  /* Parse arguments */
  while ((opt = getopt(argc, argv, ":vhd")) != -1) {
    switch (opt) {
      case 'h':
        print_usage();
        return 0;
      case 'v':
        verbose = true;
        break;
      case 'd':
        debug_mode = true;
        break;
      case '?':
        fprintf(stderr, "Unknown option: %c\n", optopt);
        return 0;
      default:
        break;
    }
  }

  /* Read ELF */
  elfPath = argv[optind];
  auto simulator = new Simulator(elfPath);
  simulator->run(debug_mode);
  return 0;
}
