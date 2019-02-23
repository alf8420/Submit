;
; AssemblerApplication1.asm
;
; Created: 2/23/2019 1:13:04 AM
; Author : ALFONSO CONTRERAS
; EMAIL: CONTRA2@UNLV.NEVADA.EDU
;


; Replace with your application code
COUNTERS:
  .equ STARTADDS= 0X0200                                       ; Starting Address 
  .equ counter1= 255                                           ; FIRST COUNTER
  .equ counter2=10                                             ; SECOND COUNTER


.org 0

   CLR R0                                                     ; Clearing RO
   
   LDI XL, LOW(STARTADDS)                                      ; STARTADDS[11:0]
   LDI XH, HIGH(STARTADDS)                                     ; STARTADDS[255:0]
   
   LDI YL, LOW(0X400)                                          ; FOR DIVISIBLE #'S BY 3
   LDI YL, HIGH(0X400)

   LDI ZL, LOW(0X600)                                          ; REST OF #'S
   LDI ZH, HIGH(0X600)   

   LDI R23, COUNTER1                                           ; R23=255
   LDI R24, COUNTER2                                           ; R24=10

   ; CLEANING REGISTERS TO ZERO 
   CLR R0=0                                                    ; R0=0
   CLR R3=0                                                    ; R3=0
   CLR R4=0                                                    ; R4=0
   CLR R6=0                                                    ; R6=0
   CLR R7=0                                                    ; R7=0
   CLR R16=0                                                   ; R16=0
   CLR R17=0                                                   ; R17=0
   CLR R18=0                                                   ; R18=0
   CLR R19=0                                                   ; R19=0


BEGIN:
   MOV R3, XL                                                  ; R3 TAKES LOW VALUES
   ADD R3, XH                                                  ; R3 TAKES ADDITION OF HIGH AND LOW
   MOV R4, R3                                                  ; COPY R3 INTO R4

   ST X+, R4                                                   ; INCREMENTING MY POINTER

   LDI R6, 3                                                   ;LOADING R6=3 TO SEE IF THE #'S DIVISIBLE BY 3
   
   INC R7                                                      ; INCREMENTING R7


   DIVBYTHREE:
   CPI R3, R6                                                  ; COMPARE IMMEDIATELY R6 WITH R3
   BRLO DIV_NO_BUENO                                           ; IF IS NOT DIVISIBLE BY 3
   SUB R3, R6                                                  ; R3 MINUS R6
   CPI R3, R0                                                  ; IF EQUAL TO ZERO
   BREQ DIV_BUENO                                              ; GO TO DIV_BUENO 

   DIV_BUENO:
   ST Z+, R4                                                   ; INCREMENT LOW AND HIGH VALUES OF Z
   ADD R16, R4                                                 ; ADD R4 TO R16 LOW VALUES
   ADC R17, R0                                                 ; R17= R0+R17
   RJMP MADE                                                   ; GO TO MADE

  
  
   MADE: 

   CPI R23, RO                                                 ; IF COUNTER EQUAL ZERO
   BREQ ALMOST                                                 ; GO TO ALMOST
   SUB R23, R7                                                 ; SUBTRACT R7 FROM R23
   BRNE BEGIN                                                  ; IF R23 IS NOT ZERO


   ALMOST:

   SUB R24, R7;                                                 ; R24 MINUS R7
   BRNE BEGIN                                                   ; IF R24 IS NOT ZERO


   END:

   RJMP COUNTERS ;                                               COUNTERS



   











.ORG 0x20
STARTADDS:
.DB 11, 12,13,14,15,16,17,18,19,20,25, 26,29,41,43,56,58,68,39,22,41, 42,73,84,85,96,87,88,89,90,35, 36,39,51,53,66,68,78,79,12,61, 112,113,114,115,116,117,118,119,200,205, 206,209,40,44,46,48,68,69,62,111, 122,173,184,185,196,187,188,189,190,135, 136,139,151,153,166,168,178,179,112,110, 222,223,224,225,216,217,218,219,220,125, 226,219,141,243,215,158,168,139



