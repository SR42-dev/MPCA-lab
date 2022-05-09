.data

	str: .asciz "my name is bond"
	letter: .asciz "n"
	
.text

	ldr r0, =str
	ldr r1, =letter
	ldr r5,[r1]
	mov r4,#0
	
loop:

	ldrb r2, [r0]
	cmp r2, #0
	beq empty
	cmp r2,r5
	beq found
	add r0, r0, #1
	b loop
	
found:

	add r4,r4,#1
	add r0,r0,#1
	b loop
	
empty:

	swi 0x011
	
.end
