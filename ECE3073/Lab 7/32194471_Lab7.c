#include <stdio.h>
#include "includes.h"

// Was told by the brief to include this library
#include <io.h>

// // Assuming these constants are defined for your 7-segment display
// // and the base addresses for each of the PIO devices are already defined under the system.h file.
// #define SEVEN_SEG_BASE 0x0000
// #define SEVEN_SEG_OFFSET 0

// void task1(void* pdata)
// {
//   int hours = 0;
//   int minutes = 0;
//   int seconds = 0;
  
//   while (1)
//   { 
//     // Update seconds and carry over to minutes and hours as needed
//     seconds++;
//     if (seconds >= 60)
//     {
//       seconds = 0;
//       minutes++;
//     }
//     if (minutes >= 60)
//     {
//       minutes = 0;
//       hours++;
//     }
//     if (hours >= 24)
//     {
//       hours = 0;
//     }
    
//     // Assuming that we have 3 separate displays for hours, minutes, and seconds
//     // Write to the 7-segment displays
//     IOWR(SEVEN_SEG_BASE, SEVEN_SEG_OFFSET, hours);
//     IOWR(SEVEN_SEG_BASE + 1, SEVEN_SEG_OFFSET, minutes);
//     IOWR(SEVEN_SEG_BASE + 2, SEVEN_SEG_OFFSET, seconds);
    
//     // Delay for 1 second
//     OSTimeDlyHMSM(0, 0, 1, 0);
//   }
// }

// #define SEVEN_SEG_BASE 0x0000
#define SEVEN_SEG_OFFSET 0
void task1(void* pdata)
{
  INT32U tickRate = OS_TICKS_PER_SEC; // Assuming this is defined
  INT32U currTicks, prevTicks = 0;
  int hours = 0, minutes = 0, seconds = 0;
  
  while (1)
  { 
    currTicks = OSTimeGet();
    
    if ((currTicks - prevTicks) >= tickRate)
    {
      // A second has passed
      seconds++;
      if (seconds >= 60)
      {
        seconds = 0;
        minutes++;
      }
      if (minutes >= 60)
      {
        minutes = 0;
        hours++;
      }
      if (hours >= 24)
      {
        hours = 0;
      }
    
      // Write to the 7-segment displays
      IOWR(HEXDISPLAY2TO0, SEVEN_SEG_OFFSET, hours);
      IOWR(HEXDISPLAY2TO0 + 1, SEVEN_SEG_OFFSET, minutes);
      IOWR(HEXDISPLAY2TO0 + 2, SEVEN_SEG_OFFSET, seconds);
      
      prevTicks = currTicks;
    }
    // No delay needed here as the time is managed by counting ticks
  }
}
