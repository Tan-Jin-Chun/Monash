// NOTE: IT IS THE SAME CODE AS THE 50Hz Frequency, ONLY DIFFERENCE IS THE COUNTER DEFINED WITHIN THE NIOS ITSELF
/* Declare volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache*/
// Declaring the volatile pointers for the input ports
volatile int * InPort_Key2 = (int *) 0x00003020;        // check port address
volatile int * InPort_MSB = (int *) 0x00003040 ;        // check port address

// Declaring the volatile pointers for the output ports
volatile int * OutPort_REDLEDS = (int *) 0x00003010;    // check port address 
volatile int * OutPort_GREENLED = (int *) 0x00003030;   // check port address
volatile int * OutPort_FLAGREDLED = (int *) 0x00003000; // check port address

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
            // Increment by 0x01 for Rising Edge Count 
            // If there is an overflow at 0xFF, it will loop back to the beginning and return to 0
            *(OutPort_REDLEDS) = *(OutPort_REDLEDS) + 0x01;  

            // Invert the bit for flag red LED
            *(OutPort_FLAGREDLED) = !(*(OutPort_FLAGREDLED));  
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