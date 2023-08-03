/* Declare volatile pointers to I/O registers. This will ensure that the resulting code will bypass the cache*/
volatile int * InPort_Key2 = (int *) 0x00003020;        // check port address
volatile int * InPort_MSB = (int *) 0x00003040 ;        // check port address
volatile int * OutPort_REDLEDS = (int *) 0x00003010;    // check port address 
volatile int * OutPort_GREENLED = (int *) 0x00003030;   // check port address
volatile int * OutPort_FLAGREDLED = (int *) 0x00003000; // check port address

int main (void){
    int prev_MSB;                       // temporary variable to save previous MSB input value 
    int curr_MSB = *(InPort_MSB);       // temporary variable to save current MSB input value (Initialized to current value)
    int prev_SW;                        // temporary variable to save previous switch input value
    int curr_SW = *(InPort_Key2);       // temporary variable to save current switch input value (Initialized to current value)
    
    while (1) {
        prev_MSB = curr_MSB;                                    // transfer processed MSB value to prev_MSB variable
        curr_MSB = *(InPort_MSB);                               // read new MSB value
        if (!prev_MSB && curr_MSB) {                            // check for rising edge condition
            *(OutPort_REDLEDS) = *(OutPort_REDLEDS) + 0x01;     // increment by 0x01 for Rising Edge Count (Overflow at 0xFF returns to 0)
            *(OutPort_FLAGREDLED) = !(*(OutPort_FLAGREDLED));   // invert bit for Flag Red LED
        }
        
        prev_SW = curr_SW;                                      // transfer processed switch value to prev_SW variable
        curr_SW = *(InPort_Key2);                               // read new switch value
        if(!prev_SW && curr_SW) {                               // check for rising edge condition
            *(OutPort_GREENLED) = !(*(OutPort_GREENLED));       // invert bit for Green LED
        }
    }
}