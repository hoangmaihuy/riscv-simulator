//
// Created by Mai Hoàng on 16/10/2021.
//

#ifndef RISCV_SIMULATOR_TESTIO_H
#define RISCV_SIMULATOR_TESTIO_H

#define MAX_STR_LENGTH 100

#define stdin 0
#define stdout 1
#define stderr 2

int getint();

long long read_long_long();

char getch();

void putint(int x);

void write_long_long(long long x);

void putch(char ch);

void write_string(char *buf);



#endif //RISCV_SIMULATOR_TESTIO_H
