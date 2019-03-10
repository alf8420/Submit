/*
 * BLINKING.cpp
 *
 * Created: 3/2/2019 3:11:06 PM
 * Author : acont
 */ 
#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>





int main(void)
{
	DDRB |= (1<<5)|(1<<4);
	PORTD |= (1<<2);
	EICRA = 0X2;
	
	EIMSK = (1<<INT0);
	sei();
    
    while (1) 
    {
		PORTB ^= (1<<4);
		_delay_ms(1000);
		
    }
}

ISR (INT0_vect)//ISR FOR EXTERNAL INTERRUPT 0
{
	PORTB ^=(1<<5);
	_delay_ms(1000);
}