/*

ARM Assembly Language programming Lab

Function    : arm64_memcpy
Description :
	To copy values from source to destination array
	Remember APCS - Arguments will be passed from x0-x7
	Results to be stored in x0
        
int arm64_memcpy(int *src, int *dest, int n);
    
	src address  ---> this will be available in x0
        dest address ---> this will be available in x1
        n ---> this will be available in x2
*/



.global arm64_memcpy

arm64_memcpy:
	mov x3,#0
copy:
	ldr w4, [x1]          /* load value from source address */
	str w4, [x0]          /* Store value to destination address */
	add x1, x1, #4        /* integer size is 4 bytes */
	add x0, x0, #4
	add x3, x3, #1
	cmp x3, x2
	b.lt copy	
	mov x0, x2
	ret
