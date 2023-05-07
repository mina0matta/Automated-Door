
_main:

;Auto_Door.c,15 :: 		void main() {
;Auto_Door.c,16 :: 		trisc=0; portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;Auto_Door.c,17 :: 		trisb=0b00011111; portb=0;
	MOVLW      31
	MOVWF      TRISB+0
	CLRF       PORTB+0
;Auto_Door.c,19 :: 		while(start==0);
L_main0:
	BTFSC      PORTB+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Auto_Door.c,21 :: 		while(1)
L_main2:
;Auto_Door.c,22 :: 		{ loop:
___main_loop:
;Auto_Door.c,24 :: 		if(exit_sensor==1||entry_sensor==1)
	BTFSC      PORTB+0, 2
	GOTO       L__main15
	BTFSC      PORTB+0, 1
	GOTO       L__main15
	GOTO       L_main6
L__main15:
;Auto_Door.c,28 :: 		motor_open=1;
	BSF        PORTC+0, 0
;Auto_Door.c,29 :: 		while(open_end==0);
L_main7:
	BTFSC      PORTB+0, 3
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;Auto_Door.c,30 :: 		motor_open=0;
	BCF        PORTC+0, 0
;Auto_Door.c,31 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Auto_Door.c,32 :: 		motor_close=1;
	BSF        PORTC+0, 1
;Auto_Door.c,34 :: 		check:
___main_check:
;Auto_Door.c,36 :: 		if(close_end==1||exit_sensor==1||entry_sensor==1)
	BTFSC      PORTB+0, 4
	GOTO       L__main14
	BTFSC      PORTB+0, 2
	GOTO       L__main14
	BTFSC      PORTB+0, 1
	GOTO       L__main14
	GOTO       L_main12
L__main14:
;Auto_Door.c,38 :: 		motor_close=0;
	BCF        PORTC+0, 1
;Auto_Door.c,39 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Auto_Door.c,40 :: 		goto loop;
	GOTO       ___main_loop
;Auto_Door.c,41 :: 		}
L_main12:
;Auto_Door.c,43 :: 		goto check;
	GOTO       ___main_check
;Auto_Door.c,45 :: 		}
L_main6:
;Auto_Door.c,47 :: 		}
	GOTO       L_main2
;Auto_Door.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
