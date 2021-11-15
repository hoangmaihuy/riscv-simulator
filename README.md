# riscv-simulator
A simple 5-stages RISCV simulator

1. 安装 `riscv-gnu-toolchain` 时需要注意添加一些参数，保证编译生成的指令系统是RV64I，指令长度固定为32位

   ```bash
   # pwd should be riscv-gnu-toolchain
   ./configure --with-arch=rv64i --with-abi=lp64 --prefix=/opt/riscv
   ```

2. 解压和编译模拟器，本项目使用 C++17，编译时需要 `g++` `cmake` `make`

   ```bash
   tar -xvf riscv-simulator
   cd riscv-simulator
   cmake CMakeLists.txt
   make
   ```

3. riscv-simulator 使用方法

   ```bash
   Usage: ./riscv-simulator [options] <elf-path>
   Options:
     -h              Print this message
     -v              Verbose mode
     -d              Debug mode
   Debug:
     r               Run till end
     n               Next cycle
     c               Run till breakpoint
     b               Set current instruction as breakpoint
     bi <address>    Set instruction at <address> as breakpoint
     bs <symbol>     Set symbol as breakpoint
     wr a            Watch all register values
     wr <reg>        Watch register <reg> value
     wmb <address>   Watch 1 byte memory (byte) at <address>
     wmh <address>   Watch 2 bytes memory (half) at <address>
     wmw <address>   Watch 4 bytes memory (word) at <address>
     wmd <address>   Watch 8 bytes memory (double) at <address>
   ```
4. cache-simulator 使用方法
   ```bash
   Usage: cache-simulator [options] trace-path

   Positional arguments:
   trace-path       	Path to trace file

   Optional arguments:
   -h --help        	shows help message and exits [default: false]
   -v --version     	prints version information and exits [default: false]
   --verbose        	Verbose mode [default: false]
   --size           	Cache size (KB) [default: 32]
   --block-size     	Block size (bytes) [default: 64]
   --associativity  	Number of lines per cache set [default: 8]
   --write-through  	Enable write through, default write-back [default: false]
   --write-allocate 	Enable write allocate, default no-write-allocate [default: false]
   ```
5. 测试，需要 `python3`

   ```bash
   # pwd should be riscv-simulator
   cd ./test
   chmod +x ./test.py
   # Run all tests
   ./test.py
   # Run a specific test
   ./test.py -i <test-path>
   ```

### 