
ARM
====
This repository is intended for teaching ARM Processor Architecture & Programming.  An ARM processor is one of a family of CPUs based on the RISC (reduced instruction set computer) architecture developed by Advanced RISC Machines (ARM). ARM makes 32-bit and 64-bit RISC multi-core processors.

Contents
========

ARM AARCH64 ISA 
=================

This module is intended to teach ARM AARCH64 Instruction set Architecture

Requirements 
=============
1. Ubuntu x86 64-bit host machine with ARM AARCH64 compiler-Reference [1] installed 
2. Install qemu-aarch64 ARM emulator :  sudo apt-get install qemu-aarch64


Instructions 
=============
1. To compile the program, run :  make clean  &&  make
2. Refer compilation steps to get executable name, run program as qemu-aarch64 ./<executable>
3. To disassemble of the program, view <executable>.dis . Note objdump is used to convert executable to assembly file


References
===========
1. ARM AARCH64 compilers : https://releases.linaro.org/components/toolchain/binaries/latest/
2. Compiler : aarch64-linux-gnu-gcc
3. Objdump  : aarch64-linux-gnu-objdump
