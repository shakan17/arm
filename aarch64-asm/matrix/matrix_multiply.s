/*

ARM Assembly Language programming Lab

Function    : matrix_multiply
Description :
	To multiply  two 4x4 matrices and return the results
	Arguments will be passed from x0-x7
	Return value to be stored in x0
        
int matrix_multiply(int a[4][4], int b[4][4]),int res[4][4];
    
	a[4][4] base addr  ---> this will be available in x0
        b[4][4] base addr  ---> this will be available in x1
        Store the result in addr in x2 -> result matrix
*/



.global matrix_multiply
.type matrix_multiply %function

matrix_multiply:
	add	x9, x2, #0x40        /* End of Result matrix */
loop:
	ldr	w5, [x0]             /* a[0][0] */   
	add	x0, x0, #0x10        /* x0 <- a[1][0] */
	ldp	w3, w8, [x2]         /* w3 <- c[0][0] , w8 <- c[0][1] */
	add	x2, x2, #0x10        /* x2 <- c[1][0] */
	ldr	w4, [x1]             /* w4 <- b[0][0] */
	ldur	w11, [x2,#-8]        /* w11 <- c[0][2] */
	cmp	x2, x9               /* End of Result matrix ? */
	madd	w5, w5, w4, w3       /* w5 <- c[0][0]+ (a[0][0] * b[0][0]) */ 
	stur	w5, [x2,#-16]        /* w5 -> c[0][0]*/
	ldur	w3, [x0,#-12]        /* w3 <- a[0][1] */
	ldr	w4, [x1,#16]         /* w4 <- b[1][0] */
	madd	w5, w3, w4, w5       /* w5 <- c[0][0] + a[0][1]*b[1][0] */
	stur	w5, [x2,#-16]        /* w5 -> c[0][0] */
	ldur	w4, [x0,#-8]         /* w4 <- a[0][2]  */
	ldr	w3, [x1,#32]         /* w3 <- b[2][0] */
	madd	w3, w4, w3, w5       /* w3 <- c[0][0] <- c[0][0] + a[0][2] * b[2][0]  */
	stur	w3, [x2,#-16]        /* w3 > c[0][0] */
	ldur	w5, [x0,#-4]         /* w5  <- a[0][3] */
	ldr	w10, [x1,#48]        /* w10 <-  b[0][3] */
	madd	w3, w5, w10, w3      /* w3 <- c[0][0] = c[0][0] + a[0][3] * b[3][0] */
	stur	w3, [x2,#-16]        /* w3 -> c[0][0] */
	ldur	w3, [x0,#-16]
	ldr	w6, [x1,#4]
	madd	w8, w3, w6, w8
	stur	w8, [x2,#-12]
	ldr	w7, [x1,#20]
	ldur	w6, [x0,#-12]
	madd	w6, w6, w7, w8
	stur	w6, [x2,#-12]
	ldr	w7, [x1,#36]
	madd	w4, w4, w7, w6
	stur	w4, [x2,#-12]
	ldr	w6, [x1,#52]
	madd	w4, w5, w6, w4
	stur	w4, [x2,#-12]
	ldr	w7, [x1,#8]
	madd	w7, w3, w7, w11
	stur	w7, [x2,#-8]
	ldur	w4, [x0,#-12]
	ldr	w6, [x1,#24]
	madd	w7, w4, w6, w7
	stur	w7, [x2,#-8]
	ldr	w8, [x1,#40]
	ldur	w6, [x0,#-8]
	madd	w6, w6, w8, w7
	stur	w6, [x2,#-8]
	ldr	w8, [x1,#56]
	ldur	w7, [x2,#-4]
	madd	w5, w5, w8, w6
	stur	w5, [x2,#-8]
	ldr	w5, [x1,#12]
	madd	w3, w3, w5, w7
	stur	w3, [x2,#-4]
	ldr	w5, [x1,#28]
	madd	w3, w4, w5, w3
	stur	w3, [x2,#-4]
	ldur	w4, [x0,#-8]
	ldr	w5, [x1,#44]
	madd	w3, w4, w5, w3
	stur	w3, [x2,#-4]
	ldur	w4, [x0,#-4]
	ldr	w5, [x1,#60]
	madd	w3, w4, w5, w3
	stur	w3, [x2,#-4]
	b.ne	loop
	ret

	.end
