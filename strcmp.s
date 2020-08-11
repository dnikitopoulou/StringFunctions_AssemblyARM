.text
.align 4 /* allignment of code*/
.global strcmp /* ourfunction name */
.type strcmp, %function

strcmp:
	stmfd sp!, { fp, lr} /* store in fully descending stack the values of fp and lr */
loop:
	ldrb r3,[r1],#1 /*r3 contains str2 chars iterating from left to right*/
	ldrb r2,[r0],#1 /*r2 contains str1 chars iterating from left to right*/
	cmp r2,r3
	movgt r0,#1 /*if char1>char2 result is 1*/
	movlt r0,#-1 /*if char1<char2 result is -1*/
	bne result
	cmp r2,#0 /*if all chars equal and we have reached '\0' result =0*/
	bne loop
	mov r0,#0
result:
	ldmfd sp!, { fp, lr} /* restore the values of  fp and lr from stack*/
	bx lr /* branch to main program */