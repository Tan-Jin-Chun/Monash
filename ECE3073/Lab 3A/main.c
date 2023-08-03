/* Declare volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache*/
volatile int * InPort_Key1 = (int *) 0x00003030; // check port address
volatile int * OutPort_GREENLED = (int *) 0x00003020; // check port address
volatile int * InPort_Key2 = (int *) 0x00003010; // check port address
volatile int * OutPort_REDLED = (int *) 0x00003000; // check port address

// Declaring the main function to carry out our operation
int main (void)
{
    // Declaring my switches
    int SW1;
    int SW2;

    // Using a while loop
    while(1)
    {
        // Assigning the variable to the first switch
        SW1 = *(InPort_Key1);

        // Using an if statement to check the first switch
        if (SW1)
        {
            // If switch 1 is on, turn the red leds on
            *(OutPort_REDLED) = 0xFF;
        }
        else
        {
            // else don't turn on the red leds
            *(OutPort_REDLED) = 0x00;
        }

        // Assigning our SW2 variable to the second switch
        SW2 = *(InPort_Key2);

        // Transfering the value to the green led
        *(OutPort_GREENLED) = SW2;
    }
}