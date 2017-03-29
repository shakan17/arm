.s.o:
	aarch64-linux-gnu-gcc  -c neon.s -o neon.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
neon: neon.o main.o 
	aarch64-linux-gnu-gcc  -static  main.o neon.o -o neon
	aarch64-linux-gnu-objdump -d  neon > neon.dis

clean:
	rm neon.o main.o neon neon.dis
