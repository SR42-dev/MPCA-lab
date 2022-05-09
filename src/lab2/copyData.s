.DATA 
	
	A: .WORD 10,20,30,40,50,60,70,80,90,100
	B: .WORD 0,0,0,0,0,0,0,0,0,0
	
.TEXT

	LDR R1, =A
	LDR R2, =B
	MOV R5, #1; count register initialization to 1
	
L1:	LDR R3, [R1]
	STR R3, [R2]
	
	ADD R1, R1, #4; address to next data
	ADD R2, R2, #4
	
	ADD R5, R5, #1; incrementing
	
	CMP R5, #11; condition to break loop at 10 values
	BNE L1
	
	SWI 0x011
	
	
