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



.global neon_matrix_multiply
.global neon_matrix_multiply_opt2
.type neon_matrix_multiply %function
.type neon_matrix_multiply_opt2  %function

 /* Optimal Implementation */

neon_matrix_multiply :

	/* Load A and B Matrix */
        LDR q0, [x0, #0]	
        LDR q1, [x0, #16]	
        LDR q2, [x0, #32]	
        LDR q3, [x0, #48]
        LDR q4, [x1, #0]	
        LDR q5, [x1, #16]	
        LDR q6, [x1, #32]	
        LDR q7, [x1, #48]
        
        /* Multiply */
        /*Row 1 */	
	MUL  v8.4s, v4.4s, v0.4s[0]
	MUL  v9.4s, v5.4s, v0.4s[1]
	MUL  v10.4s, v6.4s, v0.4s[2]
	MUL  v11.4s, v7.4s, v0.4s[3]
	add v12.4s,  v8.4s,v9.4s
	add v12.4s,  v12.4s,v10.4s
	add v12.4s,  v12.4s,v11.4s
	str q12, [x2,#0]
	/* Row 2 */
	MUL  v8.4s, v4.4s, v1.4s[0]
	MUL  v9.4s, v5.4s, v1.4s[1]
	MUL  v10.4s, v6.4s, v1.4s[2]
	MUL  v11.4s, v7.4s, v1.4s[3]
	add v12.4s,  v8.4s,v9.4s
	add v12.4s,  v12.4s,v10.4s
	add v12.4s,  v12.4s,v11.4s
	str q12, [x2,#16]
	/* Row 3 */
	MUL  v8.4s, v4.4s, v2.4s[0]
	MUL  v9.4s, v5.4s, v2.4s[1]
	MUL  v10.4s, v6.4s, v2.4s[2]
	MUL  v11.4s, v7.4s, v2.4s[3]
	add v12.4s,  v8.4s,v9.4s
	add v12.4s,  v12.4s,v10.4s
	add v12.4s,  v12.4s,v11.4s
	str q12, [x2,#32]
	/* Row 3 */
	MUL  v8.4s, v4.4s, v3.4s[0]
	MUL  v9.4s, v5.4s, v3.4s[1]
	MUL  v10.4s, v6.4s, v3.4s[2]
	MUL  v11.4s, v7.4s, v3.4s[3]
	add v12.4s,  v8.4s,v9.4s
	add v12.4s,  v12.4s,v10.4s
	add v12.4s,  v12.4s,v11.4s
	str q12, [x2,#48]
	ret

/* Other Implementation to demonstrate transpose */

neon_matrix_multiply_opt2:
        LDR q0, [x0, #0]	
        LDR q1, [x0, #16]	
        LDR q2, [x0, #32]	
        LDR q3, [x0, #48]
        LDR q4, [x1, #0]	
        LDR q5, [x1, #16]	
        LDR q6, [x1, #32]	
        LDR q7, [x1, #48]
        /* Transpose the B Matrix */
	TRN1 v8.4s, v4.4s,v5.4s	
	TRN2 v9.4s, v4.4s,v5.4s	
	TRN1 v10.4s, v6.4s,v7.4s	
	TRN2 v11.4s, v6.4s,v7.4s	
	
	TRN1 v12.2d, v8.2d,v10.2d	
	TRN2 v13.2d, v8.2d,v10.2d
	TRN1 v14.2d, v9.2d,v11.2d	
	TRN2 v15.2d, v9.2d,v11.2d
        
        /* Multiply */
        /*Row 1 */	
	MUL  v16.4s, v0.4s, v12.4s
	MUL  v17.4s, v0.4s, v14.4s
	MUL  v18.4s, v0.4s, v13.4s
	MUL  v19.4s, v0.4s, v15.4s
	ADDV s20, v16.4s
	ADDV s21, v17.4s
	ADDV s22, v18.4s
	ADDV s23, v19.4s
	STR  s20, [x2,#0]
	STR  s21, [x2,#4]
	STR  s22, [x2,#8]
	STR  s23, [x2,#12]
        /* Row 2 */
	MUL  v16.4s, v1.4s, v12.4s
	MUL  v17.4s, v1.4s, v14.4s
	MUL  v18.4s, v1.4s, v13.4s
	MUL  v19.4s, v1.4s, v15.4s
	ADDV s20, v16.4s
	ADDV s21, v17.4s
	ADDV s22, v18.4s
	ADDV s23, v19.4s
	STR  s20, [x2,#16]
	STR  s21, [x2,#20]
	STR  s22, [x2,#24]
	STR  s23, [x2,#28]
        /* Row 3 */
	MUL  v16.4s, v2.4s, v12.4s
	MUL  v17.4s, v2.4s, v14.4s
	MUL  v18.4s, v2.4s, v13.4s
	MUL  v19.4s, v2.4s, v15.4s
	ADDV s20, v16.4s
	ADDV s21, v17.4s
	ADDV s22, v18.4s
	ADDV s23, v19.4s
	STR  s20, [x2,#32]
	STR  s21, [x2,#36]
	STR  s22, [x2,#40]
	STR  s23, [x2,#44]
        /* Row 4 */
	MUL  v16.4s, v3.4s, v12.4s
	MUL  v17.4s, v3.4s, v14.4s
	MUL  v18.4s, v3.4s, v13.4s
	MUL  v19.4s, v3.4s, v15.4s
	ADDV s20, v16.4s
	ADDV s21, v17.4s
	ADDV s22, v18.4s
	ADDV s23, v19.4s
	STR  s20, [x2,#48]
	STR  s21, [x2,#52]
	STR  s22, [x2,#56]
	STR  s23, [x2,#60]
	
	ret


	.end
