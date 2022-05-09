.data

	A: .word ; holds the values

.text

   	LDR R6,=A; r6 holds the value entered
   	MOV R1,#0; initial value 0 moved into r1
   	MOV R2,#1; initial value 1 moved into r2

   	STR R1,[R6],#4; store r1 in R6 and increment 
   	STR R2,[R6],#4; store r2 in R6 and increment

   	MOV R5,#10; ten loops
   	SUB R5,R5,#2; since we already have 2 elements

LOOP:   ADD R0,R1,R2; add r1 r2 and store
   	STR R0,[R6],#4
   	MOV R1,R2
   	MOV R2,R0
   	SUBS R5,R5,#1
   	BNE LOOP

	SWI 0x011

