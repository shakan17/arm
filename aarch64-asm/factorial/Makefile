.s.o:
	aarch64-linux-gnu-gcc  -c factorial.s -o factorial.o 
.c.o:
	aarch64-linux-gnu-gcc  -c main.c -o main.o 
factorial: factorial.o main.o 
	aarch64-linux-gnu-gcc  -static  main.o factorial.o -o factorial 
	aarch64-linux-gnu-objdump -d  factorial > factorial.dis

clean:
	rm factorial.o main.o factorial factorial.dis
