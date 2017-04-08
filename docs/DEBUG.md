# Debugging Guide for GDB and Eclipse on ARM platforms
This guide will provide instructions to build ARM 64-bit linux binaries and debug on ARM platforms

# Contents

1.	Installing ARM AARCH64 GCC toolchains.
2.  Compiling and disassemble ARM 64-bit linux binaries
3.	Debugging an application using GDB command prompt.
4.	Debugging an application using Eclipse.


## 1. Installing ARM AARCH64 GCC Toolchain
The latest Linaro Linux GCC toolchains for ARM 64-bit linux platforms can be downloaded from [here](https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-linux-gnu/)
* Example [Download GCC 6.3](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz)
* Untar the toolchain package into ~/tools/linaro directory : _*tar -xJf gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz*_
* Update the PATH variable in terminal/shell : *export PATH=$PATH:~/toolchain/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu/bin/*
* Compiler : _*arch64-linux-gnu-gcc*_
* Objdump  : _*arch64-linux-gnu-objdump*_


## 2. Compiling and disassemble ARM 64-bit linux binaries

* Export the GCC toolchain binaries path in PATH variable as shown above
* To compile a program, use : *arch64-linux-gnu-gcc -static  program.c -o program.axf  *  (_Note static is used to overcome any library depoendancies in your target_)
* To disassemble the binary , use arch64-linux-gnu-objdump -d program.axf > program.S
* Refer Makefile in one of the programs in aarch64-asm folder for more details

## 3. Debugging an application with GDB

### 1.	Installing gdb-multiarch

The host needs a cross-debugger to debug an application running on the target. GDB (GNU Debugger) has a version which supports multiple architectures (such as ARM, MIPS, …) named gdb-multiarch.

#### 1.Install GDB and GDB multi-architecture:
*$ sudo apt-get install gdb
*$ sudo apt-get install gdb-multiarch 


### 2. Debugging with GDB

GDB is a text-debugger common to most Linux systems. For remote debugging, we will run gdbserver on the target, and the cross-debugger (gdb-multiarch) on the host.

1.  Build your project using the -g option to ensure the file gets debug symbols.
**This likely means adding the -g option to your CFLAGS variable in your Makefile.
2.  Install GDB server on the target:
**$apt-get update
**$apt-get install gdbserver

3. On the target, change to the directory where your application is (assumed to be named
helloWorld), and launch gdbserver:

*$gdbserver localhost:2001 helloWorld

It should look like the following (pid likely to be different):
*$gdbserver localhost:2001 helloWorld

Process helloWorld created; pid = 1068
Listening on port 2001

4.  On the host, in the directory of your helloWorld executable, launch the cross-debugger:
*$ gdb-multiarch -q helloWorld

5.	At the GDB prompt "(gdb)", type in the following command to connect to the target:

(gdb) target remote 192.168.0.102:2001

** Change the IP address to the IP address of the target.

** The host should look like this:
*gdb-multiarch -q helloWorld
*(gdb) target remote 192.168.0.171:2001
*Remote debugging using 192.168.0.171:2001
*warning: Unable to find dynamic linker breakpoint function. GDB will be unable to debug shared library initializers and track explicitly loaded dynamic code.
*0x400007b0 in ?? ()

*(gdb)

** The target should now have displayed the additional line (your IP will be different):
*** Remote debugging from host 192.168.0.188

6. You now have a GDB session. You should be familiar with the following GDB commands, Refer [GDB Commands Cheat Sheet](http://darkdust.net/files/GDB%20Cheat%20Sheet.pdf)
**	list, frame, quit
**	info breakpoints, break main, break lineNumberHere, delete 1
**	continue, print myVar, step, next
**	bt, info args, info frame, info local, up, down
**	Control + C (to interrupt program when running).
