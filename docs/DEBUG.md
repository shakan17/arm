# Debugging Guide for GDB and Eclipse on ARM platforms
This guide will provide instructions to build ARM 64-bit linux binaries and debug on ARM platforms

# Contents

1.	Installing ARM AARCH64 GCC toolchains.
2.  Compiling and dis-assemble ARM 64-bit linux binaries
3.	Debugging an application using GDB command prompt.
4.	Debugging an application using Eclipse.


## 1. Installing ARM AARCH64 GCC Toolchain
The latest Linaro Linux GCC toolchains for ARM 64-bit linux platforms can be downloaded from [here](https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-linux-gnu/)
* Example [Download GCC 6.3](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz)
* Untar the toolchain package into ~/tools/linaro directory _*tar -xJf gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz*_
* Update the PATH variable in terminal/shell  *export PATH=#PATH:~/toolchain/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu/bin/*
* Compiler : _*arch64-linux-gnu-gcc*_
* Objdump  : _*arch64-linux-gnu-objdump*_


## Compiling and dis-assemble ARM 64-bit linux binaries

* Export the GCC toolchain binaries path in PATH variable as shown above
* To compile a program, use : *arch64-linux-gnu-gcc -static  program.c -o program.axf  *  (_Note static is used to overcome any library depoendancies in your target_)
* To disassemble the binary , use arch64-linux-gnu-objdump -d program.axf > program.S
* Refer Makefile in one of the programs in aarch64-asm folder for more details

