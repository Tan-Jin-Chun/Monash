#include "nios2_ctrl_reg_macros.h"
// function prototypes
int main(void);
void interrupt_handler(void);
void the_exception (void);
/* declare glabals*/
int flag=0;
/* Declare volatile pointers to I/O registers. This will ensure that the resulting
code will bypass the cache*/
volatile int * SEVEN = (int *) 0x00005020;
volatile int * RED_LEDS = (int *) 0x00005030;
volatile int * InPort_counter = (int *) 0x00005060;
volatile int * InPort_KEY1 = (int *) 0x00005040;
volatile int * RS232 = (int *) 0x00005000;
/********************************************************************************
* This program demonstrates use of the DE2 Basic Computer RS232 serial i/f.
********************************************************************************/
int main(void)
{
    int old_KEY1=(*(InPort_KEY1));
    int temp;

    // set up rising edge triggered interrupts for the counter PIO input // enable counter MSB interrupt
    *(InPort_counter + 0x02) = 0x01;

    // set up RS232 interrupt for read ready
    // enable interrupt for irrdy
    *(RS232 + 0x03) = 0x80;

    // set interrupt mask bit for counter IRQ level 0 (counter) and 1 (RS232)
    NIOS2_WRITE_IENABLE(0x03);

    // enable Nios II interrupts (presumably PIE bit in status set to 1)
    NIOS2_WRITE_STATUS(0x01);

    while(1)
    { // normal code infinite loop

    } // end of normal code infinite loop
}