.data 

	a: .word 1, 2, 3, 4, 5, 6, 7, 8, 9; array 1
	b: .word 1, 2, 3, 4, 5, 6, 7, 8, 9; array 2
	sum: .word 0, 0, 0, 0, 0, 0, 0, 0, 0; sum array
	
.text 

	ldr r0, =a; loading array 1 base element
	ldr r1, =b; loading array 2 base element 
	ldr r2, =sum; loading sum array base element
	
	mov r3, #1; loop incrementing variable
	
l1:	ldr r4, [r0]; initialize element from array and load to register
	ldr r5, [r1]; initialize element from array and load to register
	
	add r6, r5, r4; addition operation
	
	str r6, [r2]; storing result
	
	add r0, r0, #4; array 1 increment
	add r1, r1, #4; array 2 increment
	add r2, r2, #4; sum array increment
	add r3, r3, #1; loop variable increment
	
	cmp r3, #10; comparison for 9 iterations
	bne l1
	
	swi 0x11
	
.end

	
