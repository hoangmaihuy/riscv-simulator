//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator.hpp"

Simulator::Simulator()
{
  memory = new Memory();
  cpu = new CPU();
}

void Simulator::loadMemoryFromElf(char *elfPath)
{
  ELFIO::elfio reader;
  if (!reader.load(elfPath))
  {
    fprintf(stderr, "Can't find or process ELF file %s\n", elfPath);
    exit(1);
  }

  for (auto segment : reader.segments)
  {
    auto memAddr = segment->get_virtual_address();
    auto memSize = segment->get_memory_size();
    auto flags = segment->get_flags();
    auto data = segment->get_data();

    memory->insertArea(memAddr, memSize, flags, data);

  }
}


