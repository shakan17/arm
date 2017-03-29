/*

ARM Assembly language programming lab 
Description : Program to add two numbers 

*/


#include <stdio.h>

/* Function declaration */
int add_integers(int a, int b);


int main() {
	int a = 10,b= 30 ;
	int sum = 0;
    	sum = add_integers(a,b);
	printf("Sum of %d & %d is %d\n",a,b,sum);
    	return 0;
}

