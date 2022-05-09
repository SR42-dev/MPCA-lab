.data

	a: .word 1,2,3,4,5,6,7,8,9
	b: .word 1,2,3,4,5,6,7,8,9
	c: .word 0,0,0,0,0,0,0,0,0
	
.text

	ldr r0,=a
	ldr r1,=b
	ldr r2,=c
	mov r3,#0
	mov r4,#0
	mov r10,#3
	mov r8,#0
	
loop1:

	mla r11,r3,r10,r8
	mov r11,r11,lsl #2
	ldr r5,[r0,r11]
	mla r12,r8,r10,r4
	mov r12,r12,lsl #2
	ldr r6,[r1,r12]
	mul r11,r5,r6
	add r9,r9,r11
	add r8,r8,#1
	cmp r8,#3
	bne loop1

	mla r12,r3,r10,r4
	mov r12,r12,lsl #2
	str r9,[r2,r12]
	mov r8,#0
	mov r9,#0
	add r4,r4,#1
	cmp r4,#3
	bne loop1
	swi 0x011
.end
