.TEXT

	LDR R1, =A
	LDR R2, =B
	LDR R7, =C
	LDR R8, =D
	LDR R3, [R1]; LOAD REGISTER 3 WITH DATA AT LOCATION R1
	LDR R4, [R2]; LOAD REGISTER R4 WITH DATA AT LOCATION R2
	
	AND R5, R3, R4; R5 = R3 ^ R4
	ORR R6, R3, R4; R6 = R3 v R4
	CMP R5, R6; FLAG BITS ARE ENGAGED ACCORDING TO COMPARISON
	
	MOV R9, R5
	MVN R9, R5; PERFORMS LOGICAL NOT 
	
	MOV R11, R5, LSL #2; LOGICAL SHIFT LEFT IMMEDIATE VALUE BY 2 BITS
	SWI 0x011
	
.DATA

	A: .WORD 0x88776655
	B: .WORD 0x11111111
	C: .WORD 0x00000000
	D: .WORD 0x00000000
