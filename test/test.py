#!/usr/bin/python3

import os
from os import path
import subprocess
import sys

# =========== configurable parameters ===========
# you should modify these parameters if necessary
# NOTE: all paths are relative to script path!

# current working directory should be /test

# directories that storing test cases
dirs = [
    './functional_test',
]
riscv_compiler = 'riscv64-unknown-elf-gcc'
riscv_objdump = 'riscv64-unknown-elf-objdump'
riscv_simulator = '../riscv-simulator'
io_lib = './includes/testio.c'


# ===================== end =====================


# print to stderr
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
    sys.stderr.flush()


# run single test case
def run_case(c_file, in_file, out_file):
    exec_file = f"{c_file[:-2]}.riscv"
    asm_file = f"{c_file[:-2]}.asm"
    # compile C source to executable
    compile_cmd = riscv_compiler.split(' ') + ['-w', '-march=rv64i', c_file, '-o', exec_file, io_lib]
    subprocess.run(compile_cmd, stdout=subprocess.PIPE)

    # objdump to get assembly file for debugging
    objdump_cmd = riscv_objdump.split(' ') + ['-Mno-aliases', '-D', exec_file]
    objdump_result = subprocess.run(objdump_cmd, stdout=subprocess.PIPE)
    objdump_out = f'{objdump_result.stdout.decode("utf-8").strip()}'
    with open(asm_file, "w") as f:
        f.write(objdump_out)

    # run compiled file
    run_cmd = [riscv_simulator, exec_file]
    if in_file:
        with open(in_file) as f:
            inputs = f.read().encode('utf-8')
    else:
        inputs = None
    result = subprocess.run(run_cmd, input=inputs, stdout=subprocess.PIPE)
    out = f'{result.stdout.decode("utf-8").strip()}\n{result.returncode}'
    out = out.strip()
    # compare to reference
    with open(out_file) as f:
        ref = f.read().strip()
    if out != ref:
        print("\nexpected:\n{0}\nreturned:\n{1}".format(ref, out))
    return out == ref


# run all test cases
def run_test(cases):
    total = 0
    passed = 0
    try:
        for c_file, in_file, out_file in cases:
            # run test case
            eprint(f'running test "{c_file}" ... ', end='')
            if run_case(c_file, in_file, out_file):
                eprint(f'\033[0;32mPASS\033[0m')
                passed += 1
            else:
                eprint(f'\033[0;31mFAIL\033[0m')
            total += 1
    except KeyboardInterrupt:
        eprint(f'\033[0;33mINTERRUPT\033[0m')
    except Exception as e:
        eprint(f'\033[0;31mERROR\033[0m')
        eprint(e)
        exit(1)
    # remove temporary file
    # if path.exists(eeyore_file):
    #  os.unlink(eeyore_file)
    # print result
    if passed == total:
        eprint(f'\033[0;32mPASS\033[0m ({passed}/{total})')
    else:
        eprint(f'\033[0;31mFAIL\033[0m ({passed}/{total})')


# get single test case by '*.c' file
def get_case(c_file):
    in_file = f'{c_file[:-2]}.in'
    out_file = f'{c_file[:-2]}.out'
    if not path.exists(in_file):
        in_file = None
    return c_file, in_file, out_file


# scan & collect test cases
def scan_cases(dirs):
    cases = []
    # scan directories
    for i in dirs:
        for root, _, files in os.walk(i):
            for f in sorted(files):
                # find all '*.sy' files
                if f.endswith('.c'):
                    sy_file = path.join(root, f)
                    # add to list of cases
                    cases.append(get_case(sy_file))
    return cases


if __name__ == '__main__':
    import argparse

    # initialize argument parser
    parser = argparse.ArgumentParser()
    parser.formatter_class = argparse.RawTextHelpFormatter
    parser.description = 'An auto-test tool for riscv-simulator project.'
    parser.add_argument('-i', '--input', default='',
                        help='specify input C source file, ' +
                             'default to empty, that means run ' +
                             'add tests in /test folder')
    # parse arguments
    args = parser.parse_args()
    # start running
    if args.input:
        # check if input test cast is valid
        if not args.input.endswith('.c'):
            eprint('input must be a C source file')
            exit(1)
        if not path.exists(args.input):
            eprint(f'file "{args.input}" does not exist')
            exit(1)
        # get absolute path & change cwd
        c_file = path.abspath(args.input)
        os.chdir(path.dirname(path.realpath(__file__)))
        # get test case
        case = get_case(c_file)
        if not path.exists(case[2]):
            eprint(f'output file "{case[2]}" does not exist')
            exit(1)
        # run test case
        run_test([case])
    else:
        # change cwd to script path
        os.chdir(path.dirname(path.realpath(__file__)))
        # run test cases in configuration
        run_test(scan_cases(dirs))