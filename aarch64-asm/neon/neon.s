/*

ARM Assembly Language programming Lab

Function    : neon_add
Description :
	To add two array of numbers and return the results
	Remember APCS - Arguments will be passed from x0-x7
	Results to be stored in x0
        
int neon_add(int *dest, int *src1, int *src2, int n);
    
	dest addr  ---> this will be available in x0
        src1 addr  ---> this will be available in x1
        src2 addr  ---> this will be available in x2
	n : count  ---> this will be available in x3
        Store the result in x0
*/



.global neon_add

neon_add:
	mov x4, 0           /* initialize count */
loop:
	ldr q1, [x1]        /* Q registers are 128 bit registers alias of V registers */
	ldr q2, [x2]
	add v0.4s, v1.4s, v2.4s
	str q0, [x0]
	add x4, x4, 4       /*Increment Count by 4 elements */
	add x1, x1, #16
	add x2, x2, #16
	add x0, x0, #16
	cmp x4, x3
	b.ne loop
	ret
