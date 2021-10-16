cmake_minimum_required(VERSION 3.20)
project(riscv_simulator)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)
include_directories(includes)

file(GLOB_RECURSE SOURCES "src/*.cpp" "src/riscv/*.cpp" "src/memory/*.cpp" "src/cpu/*.cpp" "src/simulator/*.cpp")

set(SOURCES ${SOURCES} test/includes/genio.c test/includes/genio.h)

add_executable(riscv-simulator ${SOURCES})
