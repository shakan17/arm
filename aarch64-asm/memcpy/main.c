/*

ARM Assembly language programming lab 
Description : Program to copy values from source to destination array 

*/


#include <stdio.h>

/* Function declaration */
int arm64_memcpy(int *dest, int *src, int n);

int source[20];
int dest[20];

int main() {
	int i = 0;
	/*initialize source */
	for(i=0; i < 20; i++)
	{
		source[i] = i*5;
		dest[i]   = 0;
		printf("Source[%d] = %d , Dest[%d] = %d\n",i,source[i],i,dest[i]);
	}
	arm64_memcpy(dest,source,20);
	printf("\n\nAfter memcpy...\n\n");
	for(i=0; i < 20; i++) {
		printf("Source[%d] = %d , Dest[%d] = %d\n",i,source[i],i,dest[i]);
	}
    	return 0;
}

