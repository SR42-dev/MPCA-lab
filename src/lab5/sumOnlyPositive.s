.data 

	a: .word 1, -2, 3, 4, 5, -6, 7, 8, -9, -10
	sum: .word 0
	
.text

	ldr r0, =a
	
	mov r1, #0; index variable
	mov r2, #0; sum variable
	
	ldr r4, =sum
	
	bl l1
	
	str r2, [r4]
	swi 0x11
	
l1:	ldr r3, [r0], #4
	movs r3, r3
	
	bpl l3
	
l2: 	add r1, r1, #1
	cmp r1, #10
	
	bne l1
	
	mov pc, lr
	
l3:	add r2, r2, r3; positive loop
	b l2
