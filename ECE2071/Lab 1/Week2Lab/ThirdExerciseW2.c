#include <stdio.h>

int main()
{
    double Ra, Rb, Rc, R1, R2, R3;
    printf("Enter the resistance for resistor Ra: ");
    scanf("%lf", &Ra);
    printf("Enter the resistance for resistor Rb: ");
    scanf("%lf", &Rb);
    printf("Enter the resistance for resistor Rc: ");
    scanf("%lf", &Rc);
    R1 = (1 / Ra + 1 / Rb + 1 / Rc) / (1 / Ra * 1 / Rb);
    R2 = (1 / Ra + 1 / Rb + 1 / Rc) / (1 / Rb * 1 / Rc);
    R3 = (1 / Ra + 1 / Rb + 1 / Rc) / (1 / Ra * 1 / Rc);
    printf("The value of R1, R2 and R3 is %.2fohm,%.2fohm and %.2fohm",R1,R2,R3);
    

    return 0;
}
