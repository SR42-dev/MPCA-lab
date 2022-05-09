; Euclid's algorithm for GCD

.data

	a: .word 6
	b: .word 4
	
.text 

	ldr r3, =a
	ldr r4, =b
	ldr r0, [r3]
	ldr r1, [r4]
	
gcd:	cmp r0, r1
	beq res
	blt loop
	sub r0, r0, r1
	b gcd
	
loop:	sub r1, r1, r0
	b gcd
	
res:	mov r2, r0
	swi 0x011
	
.end
