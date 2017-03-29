/*

ARM Assembly Language programming Lab

Function    : add_integer
Description :
	To add two numbers and return the results
	Remember APCS - Arguments will be passed from x0-x7
	Results to be stored in x0
        
int add_integers(int a, int b);
    
	a ---> this will be available in x0
        b ---> this will be available in x1
        Store the result in x0
*/



.global add_integers

add_integers:
	add x0,x0,x1
	ret
