.DATA

	SUM: .WORD 0

.TEXT

	LDR R2, =SUM
	MOV R1, #1 ; count doubles up as natural number generator
	
L1:	ADD R0, R0, R1; performs addition
	ADD R1, R1, #1; increments by 1
	CMP R1, #11
	BNE L1
	
	STR R0,[R2]
	SWI 0X011
	


