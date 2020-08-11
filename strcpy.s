.text
.align 4 /* allignment of code*/
.global strcpy /* ourfunction name */
.type strcpy, %function

strcpy:
	stmfd sp!, { fp, lr} /* store in fully descending stack the values of fp and lr */
	mov r3,r0 /*hold destination address*/
loop:
	ldrb r2,[r1],#1
	strb r2,[r0],#1 
	cmp r2,#0 /* while char not '\0' store it in dest+offset*/
	bne loop
result:
	mov r0,r3 /*r0 takes the destination address*/
	ldmfd sp!, { fp, lr} /* restore the values of  fp and lr from stack*/
	bx lr /* branch to main program */