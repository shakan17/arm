.s.o:
	aarch64-linux-gnu-gcc  -c array.s -o array.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
sum: array.o main.o
	echo "Compiling files" 
	aarch64-linux-gnu-gcc  -static  main.o array.o -o sum 
	aarch64-linux-gnu-objdump -d  sum > sum.dis
	echo "Running program"
	./sum

clean:
	rm array.o main.o sum sum.dis
