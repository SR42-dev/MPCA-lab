; find the smallest element in the array

.data

	A: .word 40,20,30,10,50,60
	result: .word 0;
	
.text

	MOV R5,#5
   	LDR R1,=A
   	LDR R2,[R1],#4

LOOP: 	LDR R4,[R1],#4
	CMP R2,R4
	BLS LOOP2
	MOV R2,R4

LOOP2:	SUBS R5,R5,#1
   	BNE LOOP

	LDR R4,=result
	STR R2,[R4]
	
	SWI 0x011

.end



