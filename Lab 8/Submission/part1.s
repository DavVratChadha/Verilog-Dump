.text
.global ONES

ONES:
	MOV R0,#0
RECUR:
	CMP R1, #0
	BEQ SUBEND
	LSR R2,R1,#1
	AND R1,R1,R2
	ADD R0,#1
	B RECUR

SUBEND: 
	MOV PC,LR

	
//LDR R1,=TEST_NUM
//LDR R1,[R1]
	
		  