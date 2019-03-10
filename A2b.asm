;
; Interrupt.asm
;
; Created: 3/9/2019 7:51:49 AM
; Author : acont
;

; This code was implemented by Alfonso Contreras
; for CPE 301  Dr.Venkatesan, and what it does is
; toggle a LED for 1250ms when the pin PD2 makes contact with ground.


.org 0              ;location for reset

JMP MAIN            ;I HAVE TO DEFINE MAIN *************************

.org 0X02                    ;location for ext_int0

JMP EXO_ISR

MAIN:
LDI R20,HIGH(RAMEND)         ;representing PB2 
OUT SPH, R20                 ;enable PB2 as output 
LDI R20, LOW(RAMEND)         ;used to set or reset PB2 
OUT SPL, R20

LDI R20, 0X2
STS EICRA, R20
SBI DDRB, 5
SBI PORTB,5                  ; defining my output
SBI PORTD, 2                 ; defining my pull-up
LDI R20, 1 <<INT0


OUT EIMSK, R20                ; Enable my INT0
SEI                           ; Enable my Global Switch
HERE: JMP HERE


EXO_ISR: 

          IN R21, PORTB 
          LDI R22, (1<<5)          ; 00100000 used to Toggle the LED
		  EOR R21, R22
		  OUT PORTB, R21
		  rcall delay_1250ms       ; calling my delay of 1250ms
		  RETI

		  delay_1250ms:
		   rcall delay_1s
		    rcall delay_100ms
			  rcall delay_100ms
			  rcall delay_100ms
			   rcall delay_10ms
			    rcall delay_10ms
				 rcall delay_10ms
				  rcall delay_10ms
				   rcall delay_10ms
				   ret

		  delay_1s:
		  rcall delay_100ms
		   rcall delay_100ms
		    rcall delay_100ms
			 rcall delay_100ms
			  rcall delay_100ms
			    rcall delay_100ms
		         rcall delay_100ms
		          rcall delay_100ms
			       rcall delay_100ms
			        rcall delay_100ms
					ret



		  delay_100ms:
		  rcall delay_10ms
		   rcall delay_10ms
		    rcall delay_10ms
			 rcall delay_10ms
			  rcall delay_10ms
		       rcall delay_10ms
		         rcall delay_10ms
		           rcall delay_10ms
				    rcall delay_10ms
					 rcall delay_10ms
					 ret
		
		delay_10ms:
		  rcall delay_1ms
		   rcall delay_1ms
		    rcall delay_1ms
			 rcall delay_1ms
			  rcall delay_1ms
			   rcall delay_1ms
			    rcall delay_1ms
				 rcall delay_1ms
				  rcall delay_1ms
				   rcall delay_1ms
				   ret

		  delay_1ms:

		  rcall delay_ms
		   rcall delay_ms
		    rcall delay_ms 
		     rcall delay_ms
			  rcall delay_ms
			   rcall delay_ms
		        rcall delay_ms
		         rcall delay_ms 
		          rcall delay_ms
			       rcall delay_ms
				    rcall delay_ms
		   rcall delay_ms
		    rcall delay_ms 
		     rcall delay_ms
			  rcall delay_ms
			  ret
		       

			  delay_ms:

			  push r16
			  ldi r16, 99
			  delay_1ms1:
			  nop
			  nop
			  nop
			  nop
			  nop
			  nop
			  nop
			  dec r16
			  brne delay_1ms1
			  pop r16
			  ret
			  
