/*

ARM Assembly language programming lab 
Description : Program to find factorial of a number 

*/


#include <stdio.h>

/* Function declaration */
int factorial(int n);


int main() {
	int n = 0,fact = 0;
	printf("Enter the number : ");
	scanf("%d",&n);
    	fact = factorial(n);
	printf("Factorial of  %d is %u\n",n,fact);
    	return 0;
}

