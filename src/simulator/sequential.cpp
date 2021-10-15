//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator.hpp"

void Simulator::s_fetch()
{
  auto instAddr = cpu->get_pc();
  auto instRaw = memory->read(instAddr, true);
  this->inst = new RVInstruction(instRaw);
  if (verbose)
  {
    fprintf(stderr, "fetch: %s\n", this->inst->to_str().c_str());
  }
}

void Simulator::s_decode()
{
  return;
}

void Simulator::s_execute()
{
  return;
}

void Simulator::s_memory()
{
  return;
}

void Simulator::s_writeback()
{
  return;
}

void Simulator::s_pcupdate()
{
  return;
}
