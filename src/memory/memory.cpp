//
// Created by Mai Hoàng on 14/10/2021.
//

#include "memory.hpp"
#include "elfio/elf_types.hpp"

void VirtualMemory::insert_vma(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size)
{
  // Check area overlap
  for (auto area: areas)
  {
    assert(start + size < area.start || start >= area.start + area.size);
  }
  areas.insert(VirtualMemoryArea(start, size, flags, data, data_size));

  if (verbose)
  {
    fprintf(stderr, "insert_vma: address = 0x%llx, size = %llu, flags = 0x%d\n", start, size, flags);
//    for (auto area: areas)
//      fprintf(stderr, "vma: start = 0x%llx, size = %llu, flags = 0x%x\n", area.start, area.size, area.flags);
  }
}

VirtualMemoryArea VirtualMemory::find_vma(uint64_t addr, uint64_t size)
{
  auto target = VirtualMemoryArea(addr, size);
  auto it = areas.upper_bound(target);
  auto prev = it;
  prev--;
  if (it == areas.begin() || addr >= prev->start + prev->size)
  {
    fprintf(stderr, "find_vma error: addr = 0x%llx, size = %llu\n", addr, size);
    exit(1);
  }
  return *prev;
}


uint64_t VirtualMemory::read(uint64_t addr, unsigned int size, bool executable)
{
  assert(size > 0 && size <= 8);
  auto vma = find_vma(addr, size);
  if (!(vma.flags & PF_R))
  {
    fprintf(stderr, "read memory error: read permission, addr = 0x%llx\n", addr);
    exit(1);
  }
  if (executable && !(vma.flags & PF_X))
  {
    fprintf(stderr, "read memory error: execute permission, addr = 0x%llx\n", addr);
    exit(1);
  }
  auto idx = addr - vma.start;
  uint64_t val = 0;
  for (int i = 0; i < size; i++)
  {
    uint64_t x = (unsigned char) vma.data[idx + i];
    val |= x << (i * 8);
  }
  return val;
}

void VirtualMemory::write(uint64_t addr, unsigned int size, uint64_t data)
{
  assert(size > 0 && size <= 8);
  auto vma = find_vma(addr, size);
  if (!(vma.flags & PF_W))
  {
    fprintf(stderr, "write memory permission error: addr = 0x%llx\n", addr);
    exit(1);
  }
  auto idx = addr - vma.start;
  for (int i = 0; i < size; i++)
  {
    auto x = (uint8_t) data;
    vma.data[idx + i] = (char) x;
    data >>= 8;
  }
}
