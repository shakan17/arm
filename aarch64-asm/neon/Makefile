.s.o:
	aarch64-linux-gnu-gcc  -c neon.s -o neon.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
sum: neon.o main.o 
	aarch64-linux-gnu-gcc  -static  main.o neon.o -o sum 
	aarch64-linux-gnu-objdump -d  sum > sum.dis

clean:
	rm neon.o main.o sum sum.dis
