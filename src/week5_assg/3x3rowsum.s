 .data
 
	a: .word 1,2,3,4,5,6,7,8,9
	b: .word 0,0,0
	
.text

	ldr r0,=a
	ldr r1,=b
	mov r2,#0
	mov r3,#0
	mov r10,#3
	mov r4,#0
	
loop:

	mla r11,r2,r10,r3
	mov r11,r11,lsl #2
	ldr r5,[r0,r11]
	add r4,r4,r5
	add r3,r3,#1
	cmp r3,#3
	bne loop
	
	mov r6,r2,lsl #2
	str r4,[r1,r6]
	add r2,r2,#1
	mov r3,#0
	mov r4,#0
	cmp r2,#3
	bne loop
	
	swi 0x011
	
.end
