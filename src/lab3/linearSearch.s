.data

	a: .word 10, 20, 30, 40, 50
	key: .word 40
	
.text

	ldr r0, =a
	ldr r1, =key
	ldr r5, [r1]
	mov r4, #1
	
loop:	ldr r2, [r0], #4; post indexing
	cmp r5, r2
	beq found
	add r4, r4, #1; traversing elements
	cmp r4, #5; checking if last element is reached
	bne loop
	mov r3, #0
	b exit
	
found:	mov r3, #1; if r3 has 1, element found
	
exit:	swi 0x011
	
.end	
	

	
