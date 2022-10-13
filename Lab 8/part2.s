.global _start
.global SWAP

_start:
    LDR R0,=LIST
    LDR R4,[R0] 	//n for layers
    MOV R5,R4		
    B BUBBLESORT
	
BUBBLESORT:
    LDR R0,=LIST
    SUB R4,R4,#1 	//1 layer deducted
    CMP R4,#0		//reached end
    BEQ END
    MOV R5,R4 
    B INNERLOOP
	
INNERLOOP:
    ADD R0,R0,#4
    MOV R3,R0
    BL SWAP			//subroutine
    CMP R5,#1
    BEQ BUBBLESORT
    SUB R5,R5,#1 	//n = n-1
    B INNERLOOP
	
SWAP:
	//load elems
    LDR R1,[R3]
    LDR R2,[R3,#4]
	//compare
    CMP R2,R1
    BLT SWAPPER
    MOV R3,#0
    MOV PC,LR
	
SWAPPER:
	STR R1,[R3,#4]
    STR R2,[R3]
    MOV R3,#1 		//Swap done
    MOV PC,LR		//End subroutine

END: 
	B END

.end
	