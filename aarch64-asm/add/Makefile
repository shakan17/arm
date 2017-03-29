.s.o:
	aarch64-linux-gnu-gcc  -c add.s -o add.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
sum: add.o main.o 
	aarch64-linux-gnu-gcc  -static  main.o add.o -o sum 
	aarch64-linux-gnu-objdump -d  sum > sum.dis

clean:
	rm add.o main.o sum sum.dis
