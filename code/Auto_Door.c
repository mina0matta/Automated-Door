/***************************
Project : Automated door
Type : PIC16F877A
Crystal : 8 MHz
***************************/
/*  stop is reset switch  */
#define start portb.b0
#define entry_sensor portb.b1
#define exit_sensor portb.b2
#define open_end portb.b3
#define close_end portb.b4
#define motor_open portc.b0
#define motor_close portc.b1
/**************************/
void main() {
 trisc=0; portc=0;
 trisb=0b00011111; portb=0;
 
 while(start==0);
 
 while(1)
  { loop:
  
    if(exit_sensor==1||entry_sensor==1)
    {
      open:
      
         motor_open=1;
         while(open_end==0);
         motor_open=0;
         delay_ms(5000);
         motor_close=1;
         
      check:
      
         if(close_end==1||exit_sensor==1||entry_sensor==1)
         {
           motor_close=0;
           delay_ms(1000);
           goto loop;
         }
      
      goto check;
      
    }
    
  }
}