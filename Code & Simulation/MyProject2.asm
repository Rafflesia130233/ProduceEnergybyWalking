
_main:

;MyProject2.c,28 :: 		void main()
;MyProject2.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject2.c,32 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject2.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject2.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject2.c,35 :: 		Lcd_Out(1,4,"Foot Step");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,36 :: 		Lcd_Out(2,1,"Power generation");                 // Write text in first row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,37 :: 		delay_ms(2000);    // wait for 2 seconds
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;MyProject2.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject2.c,41 :: 		while(1)
L_main1:
;MyProject2.c,43 :: 		adc1 = Adc_read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc1+0
	MOVF       R0+1, 0
	MOVWF      _adc1+1
;MyProject2.c,44 :: 		adc2 = Adc_read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc2+0
	MOVF       R0+1, 0
	MOVWF      _adc2+1
;MyProject2.c,45 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject2.c,46 :: 		batteryV = adc1 * (5.0/1023.0) *  5.0 ;
	MOVF       _adc1+0, 0
	MOVWF      R0+0
	MOVF       _adc1+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _batteryV+0
	MOVF       R0+1, 0
	MOVWF      _batteryV+1
	MOVF       R0+2, 0
	MOVWF      _batteryV+2
	MOVF       R0+3, 0
	MOVWF      _batteryV+3
;MyProject2.c,47 :: 		chargeV  = adc2 * (5.0/1023.0) *  2.0;
	MOVF       _adc2+0, 0
	MOVWF      R0+0
	MOVF       _adc2+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _chargeV+0
	MOVF       R0+1, 0
	MOVWF      _chargeV+1
	MOVF       R0+2, 0
	MOVWF      _chargeV+2
	MOVF       R0+3, 0
	MOVWF      _chargeV+3
;MyProject2.c,48 :: 		step = batteryV * 100;
	MOVF       _batteryV+0, 0
	MOVWF      R0+0
	MOVF       _batteryV+1, 0
	MOVWF      R0+1
	MOVF       _batteryV+2, 0
	MOVWF      R0+2
	MOVF       _batteryV+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _step+0
	MOVF       R0+1, 0
	MOVWF      _step+1
	MOVF       R0+2, 0
	MOVWF      _step+2
	MOVF       R0+3, 0
	MOVWF      _step+3
;MyProject2.c,50 :: 		floattostr(batteryV, text1);
	MOVF       _batteryV+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _batteryV+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _batteryV+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _batteryV+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _text1+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;MyProject2.c,51 :: 		floattostr(chargeV, text2);
	MOVF       _chargeV+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _chargeV+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _chargeV+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _chargeV+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _text2+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;MyProject2.c,52 :: 		floattostr(step, text3);
	MOVF       _step+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _step+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _step+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _step+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _text3+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;MyProject2.c,54 :: 		Lcd_out(1,1,txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,55 :: 		Lcd_out(1,10,Ltrim(text1));
	MOVLW      _text1+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject2.c,57 :: 		Lcd_out(2,1,txt1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,58 :: 		Lcd_out(2,11,Ltrim(text2));
	MOVLW      _text2+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject2.c,60 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;MyProject2.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject2.c,66 :: 		Lcd_out(1,1,txt3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,67 :: 		Lcd_out(1,10,Ltrim(text3));
	MOVLW      _text3+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;MyProject2.c,68 :: 		Lcd_out(2,1,txt4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject2.c,70 :: 		delay_ms(4000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;MyProject2.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject2.c,72 :: 		}
	GOTO       L_main1
;MyProject2.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
