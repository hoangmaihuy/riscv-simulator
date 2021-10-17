#include <iostream>
#include <getopt.h>
#include "global.hpp"
#include "simulator/simulator.hpp"

bool verbose = false;
bool debug_mode = false;

void print_usage() {
  printf("Usage: ./riscv-simulator [-v] <elf-path>\n");
  printf("Options: \n");
  printf("  -v    Verbose mode\n");
  printf("  -d    Debug mode\n");
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
