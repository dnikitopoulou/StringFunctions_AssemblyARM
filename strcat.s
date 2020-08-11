.text
.align 4 /* allignment of code*/
.global strcat /* ourfunction name */
.type strcat, %function

strcat:
	stmfd sp!, { fp, lr} /* store in fully descending stack the values of fp and lr */
	mov r3,r0 /*hold destination address*/
loop:
	ldrb r2,[r0],#1 /*iterate first string until its end and leave it unchanged*/
	cmp r2,#0
	bne loop
copy:
	sub r0, r0, #1 /* subtract one so as to erase 1st one's '\0'*/
loop2:
	ldrb r2,[r1],#1
	strb r2,[r0],#1 /*copy 2nd string after 1st until its end*/
	cmp r2,#0
	bne loop2
result:
	mov r0,r3 /*r0 takes the destination address*/
	ldmfd sp!, { fp, lr} /* restore the values of  fp and lr from stack*/
	bx lr /* branch to main program */