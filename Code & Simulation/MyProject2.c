sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
float v;



char txt[] = "BatteryV:";
char txt1[] = "ChargingV:";
char txt3[] = "StepOnIt";
char txt4[] = "(Approximate)";
int adc1, adc2;
float batteryV, chargeV, step;
char text1[7];
char text2[7];
char text3[7];

void main()
{

  Lcd_Init();                        // Initialize LCD
  ADC_Init();
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,4,"Foot Step");                 // Write text in first row
  Lcd_Out(2,1,"Power generation");                 // Write text in first row
  delay_ms(2000);    // wait for 2 seconds
  Lcd_Cmd(_LCD_CLEAR);               // Clear display


    while(1)
         {
          adc1 = Adc_read(2);
          adc2 = Adc_read(3);
          delay_ms(20);
          batteryV = adc1 * (5.0/1023.0) *  5.0 ;
          chargeV  = adc2 * (5.0/1023.0) *  2.0;
          step = batteryV * 100;
          
          floattostr(batteryV, text1);
          floattostr(chargeV, text2);
          floattostr(step, text3);
          
          Lcd_out(1,1,txt);
          Lcd_out(1,10,Ltrim(text1));
          
          Lcd_out(2,1,txt1);
          Lcd_out(2,11,Ltrim(text2));
          
          delay_ms(3000);
           
          Lcd_Cmd(_LCD_CLEAR);
          
          //delay_ms(2000);
          
          Lcd_out(1,1,txt3);
          Lcd_out(1,10,Ltrim(text3));
          Lcd_out(2,1,txt4);
          
          delay_ms(4000);
          Lcd_Cmd(_LCD_CLEAR);
         }
}