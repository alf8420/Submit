
; AssemblerApplication1.asm
;
; Created: 2/13/2019 10:57:02 PM
; Author : Alfonso Contreras
; Instructor: Dr. Venki Muthukumar
; This program will perform a multiplication of 16 bit multiplicand with
; a 8 bit multiplier. It uses an iterative addition to perform the multiplication.
;

START:
      LDI R25, HIGH($100)    ; R25 will hold the high value of hex 150 multiplicand
	  LDI R24, LOW($100)      ; R24 will hold the low value of hex 100  multiplicand
	  LDI R22, ($50)          ; R22 will hold the value of hex 50 multiplier
	  LDI R21, 0              ; R21 will be used to store a zero for carry
	 
	

LOOP: CPI R22, 0              ; it will compare R22 with zero
      BREQ DONE               ; it will stop when branch is equal
	  ADD R18, R24            ; it will add R24 to R18
	  ADC R19, R25            ; it will add r25 to r19 if carry is set
	  ADC R20, R21            ; it will add r21 to r20
	  DEC R22                 ; it will decrease r22
	 
	  RJMP LOOP               ; it will jump to LOOP
	  DONE:  RJMP DONE        ;it will relative jump back to DONE
	  
	  
      
