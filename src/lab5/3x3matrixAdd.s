.data

	a: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
	b: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
	sum: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
	
.text

	ldr r0, =a
	ldr r1, =b
	ldr r2, =sum
	
	mov r3, #0; inner loop (row) index
	mov r4, #0; outer loop (column) index
	mov r10, #3; number of elements in a row
	mov r12, #4
	
l1:	mla r11, r3, r10, r4; calculating offset (multiply and accumulate stage)
	mov r11, r11, lsl #2; calculating offset (left shift stage)
	
	ldr r5, [r0, r11]; adding offset to base address of r0
	ldr r6, [r1, r11]; adding offset to base address of r1
	
	add r7, r5, r6; addition operation
	
	str r7, [r2, r11]; adding offset to base address of r2
	
	add r4, r4, #1; column increment
	
	cmp r4, #3
	bne l1
	
	mov r4, #0
	add r3, r3, #1; row increment
	
	cmp r3, #3
	bne l1
	
	swi 0x11

.end
