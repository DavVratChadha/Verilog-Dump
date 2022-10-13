.global _start
_start:
	LDR R11,=0xFF200000	//LEDR
	LDR R1,=0xFFFEC600	//timer
	LDR R8,=0xFF200050 	//KEYS
	MOV R0,#0			//O = GO, 1 = STOP
	MOV R12,#0
	//LDR R2,=1
	LDR R2,=50000000	//50 mil = 0.25s
	STR R2,[R1]			//initialize timer
	LDR R2,=0b011		//set A = 1, E = 1
	STR R2,[R1,#8]
	
	//initializing pattern
	MOV R3,#0b0000000001
	MOV R4,#0b1000000000
	MOV R6,#1			//1 = CENTER, 0 = SIDES
	
LOOP:
	
	LDR R10,[R8]		//read keys
	BL WHAT_HAPPENED
	CMP R0,#2			//STOP
	BEQ LOOP
	ADD R5,R3,R4
	STR R5,[R11]			//setting pattern onto LEDR
	MOV R9,#0b1
	STR R9,[R1,#12]
	
	
INNER:
	LDR R7,[R1,#12]		//F bit
	CMP R7,#0			//not reached 0.25s
	BEQ INNER
	CMP R6,#1
	BEQ CENTER
	BLT SIDES

CENTER:
	LSL R3,R3,#1
	LSR R4,R4,#1
	CMP R3,#0b0000010000
	MOVEQ R6,#0
	B LOOP

SIDES:
	LSR R3,R3,#1
	LSL R4,R4,#1
	CMP R3,#0b0000000001
	MOVEQ R6,#1
	B LOOP
	
	
WHAT_HAPPENED:
	CMP R10,#0b1000		//key pressed	
	BEQ PRESSED
	CMP R10,#0b0		//key released
	BEQ RELEASED
	MOV PC,LR
	
PRESSED:
	CMP R0,#0		//button pressed to pause
	MOVEQ R0,#1		//pressed to pause
	CMP R0,#2		//system was at pause and button pressed
	MOVEQ R12,#1		//pressed to play leds
	MOV PC,LR
	

RELEASED:
	CMP R12,#1		//play now coz pause earlier
	MOVEQ R0,#0		
	MOVEQ R12,#0		//playing resets polling system to default state
	MOVEQ PC,LR		
	CMP R0,#1		//button released to pause
	MOVEQ R0,#2		//system at pause
	MOV PC,LR
	
	
	