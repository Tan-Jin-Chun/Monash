/* Declare volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache*/
// Declaring the volatile pointers for the input ports
volatile int * InPort_Key2 = (int *) 0x00003020;        // check port address
volatile int * InPort_MSB = (int *) 0x00003040 ;        // check port address

// Declaring the volatile pointers for the output ports
volatile int * OutPort_REDLEDS = (int *) 0x00003010;    // check port address 
volatile int * OutPort_GREENLED = (int *) 0x00003030;   // check port address
volatile int * OutPort_FLAGREDLED = (int *) 0x00003000; // check port address

// The main function
// Declaring the main function here
int main (void)
{
    // Declaring and initialising the variables
    int Prev_MSB;                       // temporary variable to save previous MSB input value 
    int Prev_SW;                        // temporary variable to save previous switch input value
    int Curr_MSB = *(InPort_MSB);       // temporary variable to save current MSB input value (Initialized to current value)
    int Curr_SW = *(InPort_Key2);       // temporary variable to save current switch input value (Initialized to current value)
    
    // Using a while loop here
    while (1) 
    {
        // Reinitialising the variables that we will be using
        // Transfer the processed MSB value to the Prev_MSB variable
        Prev_MSB = Curr_MSB;                                 

        // Initialising the new MSB value
        Curr_MSB = *(InPort_MSB);                               

        // CheckING THE rising edge condition
        if (!Prev_MSB && Curr_MSB) 
        {                            
            // Initialising the flag for the red LED
            // Just change this to 0x00 from 0x01 to get the inverse
            *(OutPort_FLAGREDLED) = 0x00;

            // Using a for loop here to introduce delay
            for (int i = 0; i < 5500; i++)
            {
                asm("add r6, r6, r0");
            }

            // Increment 1 for rising edge count , if there is an overflow it will loop back to 0x0
            *(OutPort_REDLEDS) += 0x01;

            // Set the flag of the red LEDs to be 0 when we want to end the delay
            // Change this to 0x01 to invert the GPIO output
            *(OutPort_FLAGREDLED) = 0x01;
        }

        // Reinitialising the previous switch value with the current switch value
        Prev_SW = Curr_SW;                                

        // Checking the new value of the switch
        Curr_SW = *(InPort_Key2);                              

        // Checking the rising edge conditions
        if(!Prev_SW && Curr_SW) 
        { 
            // Invert the bit for the green LED
            *(OutPort_GREENLED) = !(*(OutPort_GREENLED));   
        }
    }
}