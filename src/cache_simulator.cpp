#include <iostream>
#include <fstream>
#include <argparse/argparse.hpp>
#include "cache/config.hpp"
#include "cache/cache.hpp"
#include "memory/vm.hpp"

using namespace std;

string trace_name = "trace2";

string trace_path;
string csv_path;
CacheConfig l1_config;
VirtualMemory *mem;
Cache *l1;
int total_hit, total_time, total_request;

bool verbose = false;

void parse_args(int argc, char *argv[]) {
  argparse::ArgumentParser parser("cache-simulator");

  parser.add_argument("trace-path")
      .help("Path to trace file");

  parser.add_argument("--verbose")
      .help("Verbose mode")
      .default_value(false)
      .implicit_value(true);

  parser.add_argument("--size")
      .help("Cache size (KB)")
      .default_value(DEFAULT_CACHE_SIZE)
      .scan<'i', int>();

  parser.add_argument("--block-size")
      .help("Block size (bytes)")
      .default_value(DEFAULT_BLOCK_SIZE)
      .scan<'i', int>();

  parser.add_argument("--associativity")
      .help("Number of lines per cache set")
      .default_value(DEFAULT_CACHE_LINES)
      .scan<'i', int>();

  parser.add_argument("--write-through")
      .help("Enable write through, default write-back")
      .default_value(DEFAULT_WRITE_THROUGH)
      .implicit_value(!DEFAULT_WRITE_THROUGH);

  parser.add_argument("--write-allocate")
      .help("Enable write allocate, default no-write-allocate")
      .default_value(DEFAULT_WRITE_ALLOCATE)
      .implicit_value(!DEFAULT_WRITE_ALLOCATE);

  try {
    parser.parse_args(argc, argv);
  }
  catch (const runtime_error &err) {
    cerr << err.what() << endl;
    cerr << parser;
    exit(1);
  }

  trace_path = parser.get<string>("trace-path");
  verbose = parser.get<bool>("--verbose");
  l1_config.size = parser.get<int>("--size") * (1 << 10);
  l1_config.block_size = parser.get<int>("--block-size");
  l1_config.associativity = parser.get<int>("--associativity");
  l1_config.write_through = parser.get<bool>("--write-through");
  l1_config.write_allocate = parser.get<bool>("--write-allocate");
}

bool init_cache() {
  StorageStats stats;
  memset(&stats, 0, sizeof(stats));

  l1 = new Cache();
  mem = new VirtualMemory();

  // Init L1 cache
  l1->SetStats(stats);
  l1->SetLower(mem);
  bool valid = l1->SetConfig(l1_config);
  l1->SetLatency({L1_HIT_LATENCY, L1_BUS_LATENCY});

  // Init memory
  mem->trace_mode = true;
  mem->SetStats(stats);
  mem->SetLatency({MEM_HIT_LATENCY, MEM_BUS_LATENCY});
  return valid;
}

void handle_trace() {
  total_hit = 0;
  total_time = 0;
  total_request = 0;
  ifstream fi;
  fi.open(trace_path);
  char op;
  uint64_t addr;
  char *buf = static_cast<char *>(malloc(sizeof(char) * l1_config.block_size));
  int hit, time;
  while (fi >> op >> hex >> addr) {
    total_request++;
    if (op == 'r') {
      l1->HandleRequest(addr, 1, 1, buf, hit, time);
    } else {
      l1->HandleRequest(addr, 1, 0, buf, hit, time);
    }
    total_hit += hit;
    total_time += time;
    if (verbose) {
      cerr << op << " " << hex << addr << ": " << hit << " " << time << "\n";
    }
  }
  free(buf);
  fi.close();
}

void print_stats() {
  StorageStats stats;
  l1->GetStats(stats);
  printf("L1 Cache stats:\n");
  printf("  Access counter  :     %d\n", stats.access_counter);
  printf("  Access time     :     %d\n", stats.access_time);
  printf("  Miss number     :     %d\n", stats.miss_num);
  printf("  Miss rate       :     %f\n", (double) stats.miss_num / stats.access_counter);
  printf("  Replace number  :     %d\n", stats.replace_num);
  printf("  Prefetch number :     %d\n", stats.prefetch_num);

  mem->GetStats(stats);
  printf("Memory stats:\n");
  printf("  Access counter  :     %d\n", stats.access_counter);
  printf("  Access time     :     %d\n", stats.access_time);
}

void gen_block_size_miss_rate_report() {
  vector<int> cs = {16, 32, 64, 128, 256, 512, 1024, 4096, 16384, 32768}; // KB
  vector<int> bs = {2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096}; // Bytes
  ofstream fo;

  trace_path = "./trace/" + trace_name + ".txt";
  csv_path = "./trace/block_size_" + trace_name + ".csv";
  fo.open(csv_path);
  for (auto b: bs) {
    fo << "," << b;
  }
  fo << endl;

  for (auto cache_size: cs) {
    fo << cache_size << " KB";
    for (auto block_size: bs) {
      l1_config.size = cache_size * (1 << 10);
      l1_config.block_size = block_size;
      l1_config.associativity = DEFAULT_CACHE_LINES;
      l1_config.write_through = true;
      l1_config.write_allocate = false;

      if (!init_cache()) continue;
      handle_trace();
      StorageStats stats;
      l1->GetStats(stats);
      fo << "," << 1 - (double)total_hit / total_request;
    }
    fo << endl;
  }
}

void gen_associativity_miss_rate_report() {
  vector<int> cs = {16, 32, 64, 128, 256, 512, 1024, 4096, 16384, 32768}; // KB
  vector<int> as = {2, 4, 8, 16, 32};
  ofstream fo;
  trace_path = "./trace/" + trace_name + ".txt";
  csv_path = "./trace/associativity_" + trace_name + ".csv";
  fo.open(csv_path);
  for (auto a: as) {
    fo << "," << a;
  }
  fo << endl;

  for (auto cache_size: cs) {
    fo << cache_size << " KB";
    for (auto associativity: as) {
      l1_config.size = cache_size * (1 << 10);
      l1_config.block_size = DEFAULT_BLOCK_SIZE;
      l1_config.associativity = associativity;
      l1_config.write_through = true;
      l1_config.write_allocate = false;

      if (!init_cache()) continue;
      handle_trace();
      fo << "," << 1 - (double)total_hit / total_request;
    }
    fo << endl;
  }
}

void gen_write_policy_access_time_report() {
  vector<int> bs = {2, 4, 8, 16, 32, 64, 128, 256, 512, 1024}; // Bytes
  ofstream fo;
  trace_path = "./trace/" + trace_name + ".txt";
  csv_path = "./trace/write_policy_" + trace_name + ".csv";
  fo.open(csv_path);
  for (auto b: bs) {
    fo << "," << b;
  }
  fo << endl;
  fo << "Write back + allocate";
  for (auto block_size: bs) {
    l1_config.size = DEFAULT_CACHE_SIZE * (1 << 10);
    l1_config.block_size = block_size;
    l1_config.associativity = DEFAULT_CACHE_LINES;
    l1_config.write_through = false;
    l1_config.write_allocate = true;

    if (!init_cache()) continue;
    handle_trace();
    fo << "," << total_time;
  }
  fo << endl;


  fo << "Write through + no-allocate";
  for (auto block_size: bs) {
    l1_config.size = DEFAULT_CACHE_SIZE * (1 << 10);
    l1_config.block_size = block_size;
    l1_config.associativity = DEFAULT_CACHE_LINES;
    l1_config.write_through = true;
    l1_config.write_allocate = false;

    if (!init_cache()) continue;
    handle_trace();
    fo << "," << total_time;
  }
}

int main(int argc, char *argv[]) {
  parse_args(argc, argv);
  init_cache();
  handle_trace();
  print_stats();
//  gen_block_size_miss_rate_report();
//  gen_associativity_miss_rate_report();
//  gen_write_policy_access_time_report();
  return 0;
}
