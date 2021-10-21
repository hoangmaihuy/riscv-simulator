cmake_minimum_required(VERSION 3.20)
project(riscv_simulator)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)

file(GLOB_RECURSE SOURCES "src/*.cpp" "src/riscv/*.cpp" "src/memory/*.cpp" "src/cpu/*.cpp" "src/simulator/*.cpp")

set(SOURCES ${SOURCES} test/includes/genio.c test/includes/genio.h src/simulator/arch/single.hpp src/simulator/arch/base.hpp src/simulator/arch/base.cpp)

add_executable(riscv-simulator ${SOURCES})
