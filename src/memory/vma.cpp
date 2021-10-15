//
// Created by Mai Hoàng on 15/10/2021.
//

#include "memory.hpp"

VirtualMemoryArea::VirtualMemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data)
{
  this->start = start;
  this->size = size;
  this->flags = flags;
  this->data = static_cast<char *>(malloc(size));
  memset(this->data, 0, size);
  memcpy(this->data, (char *) data, sizeof(data));
}

VirtualMemoryArea::VirtualMemoryArea(uint64_t start, uint64_t size)
{
  this->start = start;
  this->size = size;
  this->flags = 0;
  this->data = nullptr;
}

bool VirtualMemoryArea::operator<(const VirtualMemoryArea &that) const
{
  return start < that.start;
}

