/*

ARM Assembly language programming lab 
Description : Program to add two numbers 

*/


#include <stdio.h>

/* Function declaration */
int sum_array(int *a, int n);

int array[10];

int main() {
	int i = 0,sum = 0;
	/*Initialize the array */
	for(i = 0; i < 10; i++)
		array[i] = i;
	sum = sum_array(array,i);
	printf("Assembly  : Sum of Array[%d] = %d\n",i, sum);
        /* Do sum of array through C for verification of result */
	sum = 0;
	for(i = 0; i < 10; i++)
		sum += array[i];

	printf("C Routine : Sum of Array[%d] = %d\n", i, sum);


        /* For learning Purpose */
	printf("Size of char   = %d bytes \n",sizeof(char));
	printf("Size of short  = %d bytes \n",sizeof(short));
	printf("Size of int    = %d bytes \n",sizeof(int));
	printf("Size of long   = %d bytes \n",sizeof(long));
	printf("Size of float  = %d bytes \n",sizeof(float));
	printf("Size of double = %d bytes \n",sizeof(double));
    	return 0;
}

