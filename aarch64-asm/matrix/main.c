/*

ARM Assembly language programming lab 
Description : Program to multiply 2 4x4 matrices 

*/


#include <stdio.h>

/* Function declaration */
int matrix_multiply(int m1[4][4], int m2[4][4],int res[4][4]);

void print_arr(int m[4][4])
{ 
    int i,j,row=4,col=4;
    for(i=0;i<row;i++)
    {
        for(j=0;j<col;j++)
        {
            printf("%d ",m[i][j]);
        }
        printf("\n");
    }
}

void zero_arr(int m[4][4])
{ 
    int i,j;
    for(i=0;i<4;i++)
    {
        for(j=0;j<4;j++)
        {
            m[i][j] = 0;
        }
    }
}


int c_multiply(int a[4][4], int b[4][4], int c[4][4])
{
    int i,j,k;
    for(i=0;i<4;i++)
    {
	    for(j=0;j<4;j++)
	    {
		    for (k=0;k<4;k++)
		    {
			    c[i][j] = c[i][j] + (a[i][k] * b[k][j]);
		    }
	    }
    }
}

int a[4][4] = {4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7};
int b[4][4] = {4,0,0,0,0,4,0,0,0,0,4,0,0,0,0,4};
int c[4][4] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

int main() {
	printf("Matrix Multiplication - ASM Implementation \n");
	/*Zero Initialize the result matrix */
        zero_arr(c);
    	matrix_multiply(a,b,c);
	print_arr(c);
	printf("Matrix Multiplication - C Implementation \n");
	/*Zero Initialize the result matrix */
        zero_arr(c);
    	c_multiply(a,b,c);
	print_arr(c);
    	return 0;
}

