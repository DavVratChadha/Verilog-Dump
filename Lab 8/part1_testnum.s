.text

.global ONES

ONES:
	LDR R3, =TEST_NUM 
	MOV R5,#0
	BL RECUR

END: B END

RECUR:
	MOV R0,#0
	LDR R1,[R3]
	ADD R3,R3,#4
	CMP R1,#-1
	BEQ END
	BL SUBRECUR
	CMP R0,R5
	BLT RECUR
	MOV R5, R0
	B RECUR

SUBRECUR:
	CMP R1, #0
	MOVEQ PC,LR
	LSR R2,R1,#1
	AND R1,R1,R2
	ADD R0,#1
	B SUBRECUR
	


TEST_NUM: .word 0x7fffffff, 0x12345678, -1, 0xffffffff
		  .end	



	

		  