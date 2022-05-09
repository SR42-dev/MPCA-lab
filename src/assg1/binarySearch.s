.data 

	a: .word 10, 11, 15, 17, 20, 2528, 30, 35, 40
	b: .word 30
	s: .asciiz "successful search"
	us: .asciiz "unsuccessful search"
	
.text

	ldr r1, =a
	ldr r6, =b
	ldr r7, [r6]
	mov r3, #10
	mov r4, #0
	mov r10, #4
	
loop:	

	add r5, r4, r3
	mul r11, r10, r5
	mov r5, r5, lsr #1
	sub r11, r11, #4
	ldr r8, [r1, r11]
	cmp r7, r8
	beq successful
	bpl high
	b low
	
high:	

	mov r4, r5, lsr #1
	sub r9, r3, r4
	cmp r9, #1
	beq rcheck
	b loop
	
low:	

	mov r3, r5, lsr #1
	sub r9, r3, r4
	cmp r9, #1
	beq rcheck
	b loop
	
rcheck: 

	mul r11, r10, r3
	ldr r8, [r1, r11]
	cmp r8, r7
	beq successful
	b unsuccessful
	
lcheck: 

	mul r11, r10, r4
	ldr r8, [r1, r11]
	cmp r8, r7
	beq successful
	b unsuccessful
	
successful:
	
	ldr r0, =s
	swi 0x02
	swi 0x11
	
unsuccessful:

	ldr r0, =us
	swi 0x02
	swi 0x11
	
.end
