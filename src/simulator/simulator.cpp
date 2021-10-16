//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator.hpp"

void Simulator::read_elf()
{
  if (!elfReader.load(elfPath))
  {
    fprintf(stderr, "Can't find or process ELF file %s\n", elfPath);
    exit(1);
  }
}

void Simulator::load_memory()
{
  for (auto segment: elfReader.segments)
    if (segment->get_type() == PT_LOAD)
    {
      auto memAddr = segment->get_virtual_address();
      auto memSize = segment->get_memory_size();
      auto flags = segment->get_flags();
      auto data = segment->get_data();
      auto dataSize = segment->get_file_size();

      memory->insert_vma(memAddr, memSize, flags, data, dataSize);
    }
  memory->insert_vma(STACK_ADDR, STACK_SIZE + 1, PF_R | PF_W, nullptr, 0);
}

void Simulator::init_cpu()
{
  cpu->set_pc(elfReader.get_entry());
  cpu->set_reg(2, STACK_ADDR + STACK_SIZE); // stack pointer
}

Simulator::Simulator(char *elfPath)
{
  this->elfPath = elfPath;
  memory = new VirtualMemory();
  cpu = new CPU();

  read_elf();
  load_memory();
  init_cpu();
}

