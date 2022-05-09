.data

	a: .word 1,2,3,4,5,6,7,8,9
	b: .word 0,0,0
	c: .word 0
	
.text
	ldr r0,=a
	ldr r1,=b
	ldr r2,=c
	mov r3,#0
	mov r4,#0
	mov r10,#3
	mov r5,#0
	mov r8,#0
	sub r8,r8,#1

loop:

	mla r11,r4,r10,r3
	mov r11,r11,lsl #2
	ldr r6,[r0,r11]
	cmp r6,#0
	mulmi r6,r8,r6
	add r5,r5,r6
	add r4,r4,#1
	cmp r4,#3
	bne loop
	mov r7,r3,lsl #2
	str r5,[r1,r7]
	mov r4,#0
	add r3,r3,#1
	mov r5,#0
	cmp r3,#3
	bne loop
	
	mov r3,#0
	mov r4,#0
	mov r5,#0
	ldr r3,[r1,r4]
	
max:

	add r4,r4,#4
	ldr r6,[r1,r4]
	cmp r3,r6
	movlt r3,r6
	add r5,r5,#1
	cmp r5,#2
	bne max
	
	str r3,[r2]
	swi 0x011
	
.end
