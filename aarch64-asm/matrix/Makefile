.s.o:
	aarch64-linux-gnu-gcc   -c matrix_multiply.s -o matrix_multiply.o
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
mmultiply: matrix_multiply.o main.o 
	aarch64-linux-gnu-gcc  -O3 -static  main.o matrix_multiply.o -o mmultiply 
	aarch64-linux-gnu-objdump -d  mmultiply > mmultiply.dis

clean:
	rm matrix_multiply.o main.o mmultiply mmultiply.dis
