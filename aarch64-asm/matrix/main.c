/*

ARM Assembly language programming lab 
Description : Program to multiply 2 4x4 matrices 

*/


#include <stdio.h>

/* Function declaration */
int asm_matrix_multiply(int m1[4][4], int m2[4][4],int res[4][4]);
int neon_matrix_multiply(int m1[4][4], int m2[4][4],int res[4][4]);
int neon_matrix_multiply_opt2(int m1[4][4], int m2[4][4],int res[4][4]);

void print_arr(int m[4][4])
{
    printf("****************************************************\n"); 
    int i,j,row=4,col=4;
    for(i=0;i<row;i++)
    {
        for(j=0;j<col;j++)
        {
            printf("%d ",m[i][j]);
        }
        printf("\n");
    }
    printf("****************************************************\n"); 
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


int c_matrix_multiply(int a[4][4], int b[4][4], int c[4][4])
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

int a[4][4] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
int b[4][4] = {4,0,0,0,0,4,0,0,0,0,4,0,0,0,0,4};
int c[4][4] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

int main() {
	printf("Matrix Multiplication - C Implementation \n");
	/*Zero Initialize the result matrix */
        zero_arr(c);
    	c_matrix_multiply(a,b,c);
	print_arr(c);
	printf("Matrix Multiplication - ASM Implementation \n");
	/*Zero Initialize the result matrix */
        zero_arr(c);
    	asm_matrix_multiply(a,b,c);
	print_arr(c);
	printf("Matrix Multiplication - NEON Implementation \n");
	/*Zero Initialize the result matrix */
        zero_arr(c);
    	neon_matrix_multiply(a,b,c);
	print_arr(c);
    	return 0;
}

