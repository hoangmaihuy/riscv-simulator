//
// Created by Mai Hoàng on 14/10/2021.
//

#include "memory.hpp"
#include "elfio/elf_types.hpp"

void VirtualMemory::insert_vma(uint64_t start, uint64_t size, uint8_t flags, const char *data)
{
  // Check area overlap
  for (auto area: areas)
    assert(start + size < area.start || start >= area.start + area.size);
  areas.insert(VirtualMemoryArea(start, size, flags, data));
}

VirtualMemoryArea VirtualMemory::find_vma(uint64_t addr, uint64_t size)
{
  auto target = VirtualMemoryArea(addr, size);
  auto it = areas.lower_bound(target);
  if (it == areas.end() || addr + size > it->start + it->size)
  {
    fprintf(stderr, "find_vma error: addr = 0x%llx, size = %llu\n", addr, size);
    exit(1);
  }
  return *it;
}


uint32_t VirtualMemory::read(uint64_t addr, bool executable)
{
  auto vma = find_vma(addr, sizeof(uint32_t));
  if (!(vma.flags & PF_R))
  {
    fprintf(stderr, "read memory error: read permission, addr = 0x%llx", addr);
    exit(1);
  }
  if (executable && !(vma.flags & PF_X))
  {
    fprintf(stderr, "read memory error: execute permission, addr = 0x%llx", addr);
    exit(1);
  }
  auto idx = addr - vma.start;
  return vma.data[idx] | (vma.data[idx + 1] << 8) | (vma.data[idx + 2] << 16) | (vma.data[idx + 3] << 24);
}

uint64_t VirtualMemory::readw(uint64_t addr)
{
  uint64_t low = read(addr, false);
  uint64_t high = read(addr + 5, false);
  return (high << 32) | low;
};

