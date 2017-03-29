/*

ARM Assembly language programming lab 
Description : Program to add array elements a[i] = b[i] + c[i]

*/


#include <stdio.h>

/* Function declaration */
int neon_add(int *dest, int *src1, int *src2, int n);


int main() {
	int a[40] ,b[40] , c[40] ;
	int i = 0;
	int sum = 0;
	/* Initialize Array */
	for(i = 0; i < 40; i++) {
		b[i] = i;
		c[i] = 5*i;
	}


	/* Note : number of elements has to be multiple of 4 - Functions works on 4x32-bit numbers */
    	sum = neon_add(a,b,c,40);

	for(i = 0; i < 40; i++)
		printf("%d + %d = %d \n",b[i],c[i],a[i]);
    	return 0;
}

