.data

	odd: .asciz "odd parity number"
	even: .asciz "even parity number"
	a: .word 4
	
.text

	ldr r2, =a
	ldr r3, [r2]
	mov r6, #0; count register
	mov r4, #0; count number of 1s
	
l1: 	tst r3, #1
	bne l3
	
l2:	mov r3, r3, lsr #1
	add r6, r6, #1
	
	cmp r6, #32
	bne l1
	
	tst r4, #1
	beq l4
	ldr r0, =odd; all strings to be printed must be loaded here
	swi 0x02; print software interrupt
	b exit

l3: 	add r4, r4, #1
	b l2
	
l4:	ldr r0, =even
	swi 0x02; print outputs visible in OutputView stdin/stdout/stderr
	b exit
	
exit:	swi 0x11

.end
