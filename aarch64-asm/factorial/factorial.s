/*

ARM Assembly Language programming Lab

Function    : factorial
Description :
	To find factorial of number
	Remember APCS - Arguments will be passed from x0-x7
	Results to be stored in x0
        
int factorial(int n);
    
	n ---> this will be available in x0
        Store the result in x0
*/



.global factorial

factorial:
	mov x1,#1          /* Counter */
	mov x2,#1          /* Result */
fact:
	mul x2, x2, x1     /* 1*2*3*...n*/
	add x1, x1, #1     
	cmp x1, x0
	b.le fact
	mov x0, x2
	ret
