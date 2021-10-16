//
// Created by Mai Hoàng on 15/10/2021.
//

#include "memory.hpp"

VirtualMemoryArea::VirtualMemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size)
{
  this->start = start;
  this->size = size;
  this->flags = flags;
  this->data = static_cast<char *>(malloc(size));
  memset(this->data, 0, size);
  if (data_size && data) {
    memcpy(this->data, (char *) data, data_size);
  }
}

VirtualMemoryArea::VirtualMemoryArea(uint64_t start, uint64_t size)
{
  this->start = start;
  this->size = size;
  this->flags = 0;
}

bool VirtualMemoryArea::operator<(const VirtualMemoryArea &that) const
{
  return start + size <= that.start;
}

