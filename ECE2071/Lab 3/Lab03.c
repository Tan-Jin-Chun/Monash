// The purpose of this program is to find the value of the array multiplied by itself to the power of a certain number
// Written by Tan Jin Chun
// Last modified : 18/3/2021

#include <stdio.h>

int main() {
    int S;
    int N;

    // Requesting the user the size of the array
    printf("Please give a value of the size of the array(1-5): ");
    scanf("%d", &S);

    // Requesting the user for the power
    printf("Please give a value for N(positive integer): ");
    scanf("%d", &N);

    // Declaring arrays since 5 is the maximum value for size
    int array1[5][5];
    int array2[5][5];
    int array3[5][5];

    // Using two for loops to insert the value into the matrix created
    // The inner loop will insert the value into respective column
    // The outer loop will insert the value into the subsequent row

    // Requesting the user for the values for the array and printing the statements out
    for(int row = 0; row < S; row++) {
        for(int col = 0; col < S ; col++) {
            printf("Please enter the value in the matrix for position[%d][%d]: ",row,col);
            scanf("%d" , &array1[row][col]);
            array2[row][col] = array1[row][col];
        }
    }

    // Array Multiplication (6 for loops)
    int sum;
    // The for loop will go through the below three for loops again due to the differnce in power
    for(int j = 1; j < N ; j++) {

    //Code to multiply an array with another array
        for (int row = 0; row < S; row++) {
            for (int col = 0; col < S; col++) {

                // integer k is basically a variable to change the col of a array and row of another array
                for (int k = 0; k < S; k++) {
                    sum += array2[row][k] * array1[k][col];
                }
                array3[row][col] = sum;
                sum = 0;
            }
            
         }

         // Multiplying the matrix to the given power
         // Basically updating the second array to the calculated array from the above loop
         // Array 1 will remain constant as the input of the user
        for (int row = 0; row < S; row++) {
            for (int col = 0; col < S; col++) {
                array2[row][col] = array3[row][col];
            }
          }
    }

    // Printing of the result (Using pointers to print)
    for(int row = 0; row < S ; row++) {
        for(int col = 0 ; col < S ; col++) {
            printf("%d   " , array3[row][col]);
        }
        printf("\n");
    }
    return 0;

}

// Using Pointers but only work for 2x2 arrays
// Doing array multiplication with pointers
// The purpose of this program is to
// Written by Tan Jin Chun
// Last modified : 18/3/2021

/*#include <stdio.h>

int main() {
    int S;
    int N;

    // Requesting the user the size of the array
    printf("Please give a value of the size of the array(1-5): ");
    scanf("%d", &S);

    // Requesting the user for the power
    printf("Please give a value for N(positive integer): ");
    scanf("%d", &N);

    // Since 5 is the maximum value for size
    int array1[5][5];
    int array2[5][5];
    int array3[5][5];

    // Declaring pointers
    int *ptr1 = &(array1[0][0]);
    int *ptr2 = &(array2[0][0]);
    int *ptr3 = &(array3[0][0]);


    // Using two for loops to insert the value into the matrix created
    // The inner loop will insert the value into respective column
    // The outer loop will insert the value into the subsequent row

    // Requesting the user for the values for the array and printing the statements out
    for(int row = 0; row < S; row++) {
        for(int col = 0; col < S ; col++) {
            printf("Please enter the value in the matrix for position [%d][%d]: ",row,col);
            scanf("%d" , &array1[row][col]);
            array2[row][col] = array1[row][col];
        }
    }

    // Array Multiplication (4 for loops)
    for(int i = 1; i < N; i++)
    {
        for(int row = 0; row < S; row++) 
        {
            for(int col = 0; col < S ; col++) 
            {
                *(ptr3+(row*5+col)) = 0;
                for(int j = 0; j < S ; j++)
                {
                  *(ptr3+(row*5+col)) += *(ptr1+(row*5+j)) * *(ptr2+(j*5+col));

                if(N > 2) {
                  *(ptr2+(j*5+col)) = *(ptr3+(row*5+col));
                } 
                
                }

            }
        }
    }

    // Printing of the result
    for(int row = 0; row < S ; row++) {
        for(int col = 0 ; col < S ; col++) {
            printf("%d   " , array3[row][col]);
        }
        printf("\n");
    }
    return 0;

} */
