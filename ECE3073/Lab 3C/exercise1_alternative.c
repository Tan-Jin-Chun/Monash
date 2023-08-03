// Code from RAMA's Demo Video
/* Declaring volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache */
volatile int * InPort_Key2 = (int *) 0x00003020; // check port address of SW2
volatile int * OutPort_GREENLED = (int *) 0x00003030; // check port address of green LED
volatile int * OutPort_REDLED = (int *) 0x00003010; // check port address of red LED
volatile int * OutPort_Counter = (int *) 0x00003040;
volatile int * OutPort_Channel2 = (int *) 0x00003000;

// The main function
int main(void)
{
    int i = 0;
    // int SW_value; // temporary place to store the KEY1 value
    // int On_value = 0xff; // turn on value of the red LED
    int prev_state = 0x00;
    int counter = 0x00;
    int cycle_counter = 0;

    while (1)
    {
        // Continually making the REDLEDS light up
        *(OutPort_REDLED) = 0xff;
    }
}