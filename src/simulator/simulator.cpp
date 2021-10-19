//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator.hpp"
#include "cpu/cpu.hpp"

void Simulator::read_elf() {
  if (!elfReader.load(elfPath)) {
    fprintf(stderr, "Can't find or process ELF file %s\n", elfPath);
    exit(1);
  }
  /* Read symbols to find `exit` as terminate instruction */
  for (auto section: elfReader.sections)
    if (section->get_type() == SHT_SYMTAB) {
      const ELFIO::symbol_section_accessor symbol_accessor(elfReader, section);
      std::string name;
      ELFIO::Elf64_Addr value;
      ELFIO::Elf_Xword size;
      unsigned char bind;
      unsigned char type;
      ELFIO::Elf_Half section_index;
      unsigned char other;
      for (int i = 0; i < symbol_accessor.get_symbols_num(); i++) {
        symbol_accessor.get_symbol(i, name, value, size, bind, type, section_index, other);
        this->symbols[name] = value;
      }
      break;
    }
}

void Simulator::load_memory() {
  for (auto segment: elfReader.segments)
    if (segment->get_type() == PT_LOAD) {
      auto memAddr = segment->get_virtual_address();
      auto memSize = segment->get_memory_size();
      auto flags = segment->get_flags();
      auto data = segment->get_data();
      auto dataSize = segment->get_file_size();

      memory->insert_vma(memAddr, memSize, flags, data, dataSize);
    }
  memory->insert_vma(STACK_ADDR, STACK_SIZE, PF_R | PF_W, nullptr, 0);
}

void Simulator::init_cpu() {
  cpu->set_pc(elfReader.get_entry());
  cpu->set_reg(reg("sp"), STACK_ADDR + STACK_SIZE);
}

Simulator::Simulator(char *elfPath) {
  this->elfPath = elfPath;
  memory = new VirtualMemory();
  cpu = new CPU();

  read_elf();
  load_memory();
  init_cpu();
}

void Simulator::run(bool debug_mode) {
  string cmd = "r";
  while (true) {
    if (debug_mode) {
      cin >> cmd;
    }
    handle_cmd(cmd);
  }
}

void Simulator::handle_cmd(const string &cmd) {
  string sym;
  char regname[5];
  uint64_t addr;
  if (cmd == "r") { // run till end
    while (true)
      run_cycle();
  } else if (cmd == "c") { // continue run till breakpoint
    while (!is_breakpoint(cpu->get_pc()))
      run_cycle();
  } else if (cmd == "n") { // next cycle
    run_cycle();
  } else if (cmd == "b") { // set current instruction as breakpoint
    breakpoints.insert(cpu->get_pc());
  } else if (cmd == "bs") { // set symbol as breakpoint
    cin >> sym;
    addr = get_symbol(sym);
    if (addr == -1) {
      cerr << "No symbol " << sym;
    } else {
      breakpoints.insert(addr);
    }
  } else if (cmd == "bi") { // set instruction address as breakpoint
    cin >> std::hex >> addr;
    breakpoints.insert(addr);
  } else if (cmd == "wr") { // watch register
    scanf("%s", regname);
    if (strcmp(regname, "a") == 0) {
      cpu->print();
    } else {
      fprintf(stderr, "reg[%s] = 0x%llx", regname, cpu->get_reg(reg(regname)));
    }
  } else if (cmd == "wmb") { // watch memory byte
    cin >> std::hex >> addr;
    fprintf(stderr, "mem[0x%llx] = 0x%llx", addr, memory->read(addr, 1));
  } else if (cmd == "wmh") { // watch memory half
    cin >> std::hex >> addr;
    fprintf(stderr, "mem[0x%llx] = 0x%llx", addr, memory->read(addr, 2));
  } else if (cmd == "wmw") { // watch memory word
    cin >> std::hex >> addr;
    fprintf(stderr, "mem[0x%llx] = 0x%llx", addr, memory->read(addr, 4));
  } else if (cmd == "wmd") { // watch memory double
    cin >> std::hex >> addr;
    fprintf(stderr, "mem[0x%llx] = 0x%llx", addr, memory->read(addr, 8));
  }
  cerr << "\n";
}

uint64_t Simulator::get_symbol(const string &sym) {
  auto it = symbols.find(sym);
  if (it == symbols.end()) {
    return -1;
  }
  return it->second;
}

bool Simulator::is_breakpoint(uint64_t addr) {
  return breakpoints.find(addr) != breakpoints.end();
}