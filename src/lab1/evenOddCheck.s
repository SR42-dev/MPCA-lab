.TEXT

	MOV R1, #10
	ANDS R2, R1, #1
	
	BEQ LABEL1
	
		MOV R0, #0xFF
		B EXIT
		
	LABEL1:
	
		MOV R0, #0
	
	EXIT:
	
		.end


	


		

