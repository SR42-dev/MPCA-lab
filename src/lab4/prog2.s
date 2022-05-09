; move a words into another register in 3 groups of 8 at a time)

.data

   	A: .word 10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240
   	B: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.text
	
   	LDR R0, =A
   	LDR R9, =B
   
   	MOV R10,#0
   
loop: 	LDMIA R0!,{R1-R8} 
        STMIA R9!,{R1-R8}
        ADD R10,R10,#1
        CMP R10,#3
        BNE loop
        
	SWI 0x011
.end

