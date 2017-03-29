.s.o:
	aarch64-linux-gnu-gcc  -c memcpy.s -o memcpy.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
memcpy: memcpy.o main.o 
	aarch64-linux-gnu-gcc  -static  main.o memcpy.o -o memcpy 
	aarch64-linux-gnu-objdump -d  memcpy > memcpy.dis

clean:
	rm memcpy.o main.o memcpy memcpy.dis
