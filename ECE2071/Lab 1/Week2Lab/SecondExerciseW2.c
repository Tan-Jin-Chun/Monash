#include <stdio.h>
#include <math.h>

int main()
{
    double const B = 2500;
    double const K = 0.34094;
    double const R1 = 10e+03;
    int const Vtot = 5;
    double tk,tc , R2, V1, I1, V2;
    printf("The value for Vout: "); // prompting the user for Vout
    scanf("%lf", &V2);
    V1 =Vtot - V2;
    I1 = V1 / R1 ; 
    R2 = V2 / I1 ;
    tk = B / log(R2 / K) ;
    tc = tk - 273.16;
    printf("The corresponding temperature is %.2f(%.2f)", tk, tc);
    return(0);
}