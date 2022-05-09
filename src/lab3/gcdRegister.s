; Euclid's algorithm for GCD
	
.text 

	mov r0, #3
	mov r1, #4
	
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
