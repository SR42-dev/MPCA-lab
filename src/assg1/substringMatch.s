.data

	a: .asciz "abcd efgh"
	b: .asciz "ef"
	s: .asciz "substring found"
	us: .asciz "substring not found"
	
.text

	ldr r1, =a
	ldr r2, =b
	mov r5, #14
	mov r6, #3
	sub r7, r5, r6
	mov r8, #1
	
outer:	
	
	ldrb r3, [r1]
	ldrb r4, [r2]
	cmp r3, r4
	mov r9, #0
	beq inner
	add r1, r1, #1
	cmp r8, r7
	beq exit
	add r8, r8, #1
	b outer
	
inner:	

	cmp r4, #0
	beq successful
	add r9, r9, #1
	add r1, r1, #1
	add r2, r2, #1
	ldrb r3, [r1]
	ldrb r4, [r2]
	cmp r3, r4
	beq inner
	sub r1, r1, r9
	add r1, r1, #1
	sub r2, r2, r4
	b outer
	
successful:

	ldr r0, =s
	swi 0x02
	swi 0x11
	
exit:

	ldr r0, =us
	swi 0x02
	swi 0x11
	
