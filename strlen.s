.text
.align 4 /* allignment of code*/
.global strlen /* ourfunction name */
.type strlen, %function

strlen:
	stmfd sp!, { fp, lr} /* store in fully descending stack the values of fp and lr */
	mov r2,#0 /*counter */
loop:
	ldrb r1,[r0],#1 @r0=*str
	cmp r1,#0 /*increase counter while char not '\0'*/
	addne r2,r2,#1
	bne loop
result:
	mov r0,r2 /*result in r0 */
	ldmfd sp!, { fp, lr} /* restore the values of  fp and lr from stack*/
	bx lr /* branch to main program */
