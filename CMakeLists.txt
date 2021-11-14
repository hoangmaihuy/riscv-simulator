cmake_minimum_required(VERSION 3.20)
project(riscv_simulator)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)

file(GLOB_RECURSE RISCV_SOURCES "src/riscv_simulator.cpp" "src/riscv/*.cpp" "src/memory/*.cpp" "src/cpu/*.cpp" "src/simulator/*.cpp" "src/simulator/arch/*.cpp" "src/cache/*.cpp")

file(GLOB_RECURSE CACHE_SOURCES "src/cache_simulator.cpp" "src/cache/*.cpp" "src/memory/*.cpp")

add_executable(riscv-simulator ${RISCV_SOURCES})
add_executable(cache-simulator ${CACHE_SOURCES})
