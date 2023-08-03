// Lab 1.cpp : Defines the entry point for the console application.
//
// Program to calculate the frequency of a 555 timer astable oscillator
//

//#include <stdafx.h>
#include <stdio.h>			// give access to printf and scanf functions (error:should use angled brackets)

int main(int argc, char* argv[]) //
{
	double freq;						// 
	double r1, r2, c1;				// declare the variables we will be using
	const double numerator = 1.44;	// the constant numerator used in the frequency calculation (error:wrong value)

	printf("Enter the value of r1 in kilohms: ");    // enter the circuit values
	scanf("%lf", &r1); // (error::) (error: no pointer for r1)
	printf("Enter the value of r2 in kilohms: ");
	scanf("%lf", &r2);
	printf("Enter the value of c1 in microfarads: ");
	scanf("%lf", &c1);

	freq = numerator / ((r1*1000+2.0*r2*1000)*c1*1e-06 ); // calculate the frequency (error: c1 should be inside parenthesis and microfarads)
	printf("The oscillator frequency is: %.lf Hz\n",freq); // display the result (error:print)(change:remove the .2 to produce an integer)

	return (0);
}