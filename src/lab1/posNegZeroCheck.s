MOV R0, #-5
SUBS R2, R0, #0
BEQ Z
	B NP
Z: 
	
	MOV R1, #0
	SWI 0X011
	
NP: 
	
	SUBS R2, R0, #0
	BLT N
	MOV R1, #2
	SWI 0X011
	
N: 

	MOV R1, #3

	
