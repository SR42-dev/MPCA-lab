MOV R1, #5
MOV R2, #6
MOV R3, #7
MOV R4, #8
MOV R5, #9

ADD R6, R1, R2
ADD R7, R3, R4
ADD R8, R6, R5
ADD R8, R8, R7

SWI 0x011

