.DATA

	A:  .WORD 10,20,30,40,50,60,70,80,90,100
	SUM:  .WORD 0
	
.TEXT

	LDR R1, =A
	LDR R2, =SUM
	
	MOV R4, #0; sum register
	MOV R5, #1; count register
	
L1:	LDR R3, [R1]
	ADD R4, R4, R3
	ADD R1, R1, #4   
	ADD R5, R5, #1   
	CMP R5, #11        
	BNE L1                   
	
	STR R4,[R2]          
	SWI 0X011            
