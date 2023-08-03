#include <stdint.h>
//Using uint8_t could make the value 0xFF jumps back to 0x00 without using if else statement
/* Declare volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache*/
volatile int * InPort_Counter = (int*) 0x00003040; 
volatile int * InPort_Key2 = (int *) 0x00003020; // check port address 

volatile uint8_t * OutPort_REDLED = (uint8_t *) 0x00003010; // check port address
volatile int * OutPort_FLAG = (int *) 0x00003000; // check port address
volatile int * OutPort_GREENLED = (int *) 0x00003030; // check port address

int main (void)
{
    
    int Counter_value; 
    int Old_counter_value = *(InPort_Counter);
    int Current_Green = 0x0;
    int Prev_Green = Current_Green;
    
    while(1)
    {
        
        Counter_value = *(InPort_Counter);
        //Check Rising Edge
        if (!Old_counter_value && Counter_value)
        {
            //If condition is satisfied then call required service
            *(OutPort_REDLED) += 0x01;
            *(OutPort_FLAG) = ~*(OutPort_FLAG);
        }
        
        Current_Green = *(InPort_Key2);
        if (Current_Green && !Prev_Green)
	  {
            *(OutPort_GREENLED) = ~*(OutPort_GREENLED);
        }
        Prev_Green = Current_Green;
        
        Old_counter_value = Counter_value;
    }
    
}
