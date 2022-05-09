.data

	a: .word 2137453647
	b: .word 0
	
.text

	ldr r0,=a
	ldr r3,=b
	ldr r1,[r0]
	mov r5,#0
	mov r2,#0;sum
	and r4,r1,#1
	add r2,r2,r4
loop:

	mov r1,r1,lsr #1
	and r4,r1,#1
	add r2,r2,r4
	add r5,r5,#1
	cmp r5,#31
	bne loop

	str r2,[r3]
	swi 0x011

.end

