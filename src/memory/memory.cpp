//
// Created by Mai Hoàng on 14/10/2021.
//

#include "memory.hpp"

void Memory::insertArea(uint64_t start, uint64_t size, uint8_t flags, const char *data)
{
  // Check area overlap
  for (auto area: areas)
    assert(start + size < area.start || start >= area.start + area.size);
  areas.insert(MemoryArea(start, size, flags, data));
}

bool MemoryArea::operator<(const MemoryArea &that) const
{
  return start < that.start;
}

MemoryArea::MemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data)
{
  this->start = start;
  this->size = size;
  this->flags = flags;
  this->data = static_cast<char *>(malloc(size));
  memset(this->data, 0, size);
  memcpy(this->data, (char*)data, sizeof(data));
}

