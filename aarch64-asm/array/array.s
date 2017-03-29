/*

ARM Assembly Language programming Lab

Function    : add_integer
Description :
	To add array of  numbers and return the results
	Remember APCS - Arguments will be passed from x0-x7
	Results to be stored in x0

int sum_array(int *addr, int n); 
    
	addr ---> this will be available in x0
        n    ---> this will be available in x1
        Store the result in x0
*/



.global sum_array

sum_array:
	mov w3, #0   /* Size counter */
	mov w4, #0   /* result */
sum:
	ldr w2, [x0]      /* Read array[i]   */
	add w4, w2, w4    /* Sum += array[i] */
	add x0, x0, #4    /* Add adress by 4 - Integer Size is 4 bytes  */
	add w3, w3, #1    /* Increment the Size counter */
	cmp w3, w1
	b.lt sum
	mov x0,x4
	ret
