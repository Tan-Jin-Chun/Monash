// Week 3 Assignment
// Program to find the probability of covid transmission outside to the public
// Written by Tan Jin Chun (32194471)
// Date Modified: 2021-03-10

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

// This function simulates events, returning true with a given probability
bool sample_event(float probability)
{
    // Draw a random number between 0 and 100, if less than p (p%) 
    // then return true
    double val = (double)rand() / RAND_MAX * 100;
    if (val <= probability)
    {
        return true;
    }
    return false;
}

// This function simulates the chances of patients arriving with Covid (50%) 
// returns 't' if they were Covid Positive or 'f' if Covid Negative
char patient_arrives()
{
    if (sample_event(50)) // 50% chance of returning true
    {
        return 't'; // Set Patient Status as Covid Positive
    }
    return 'f'; // Set Patient Status as Covid Negative
}

// This function simulates a covid test result, detecting Covid successfully 95% of the time, 
// returning 'd' if Covid Detected, else maintain existing status
char covid_test(char status)
{
    if (status == 't') // If person is Covid Positive
    {
        if (sample_event(95)) // 95% chance of returning true
        {
            return 'd'; // Set person status as Covid Detected
        }
    }
    return status; // Maintain existing status
}

// This function simulates aircon transmission, with staff and patients having a 1% chance of catching covid from each other
// returns 't' if Covid transmitted, otherwise maintain existing status
char simulate_aircon_transmission(char status)
{
    if (status != 'i') //Not already in isolation
    {
        if (sample_event(1)) // 1% chance of returning true
        {
            return 't'; // Set person status as Covid Positive
        }
    }
    return status; //Maintain existing status
}

// This function simulates direct transmission, with person2 having a 1% chance of catching covid if person1 has covid
// returns 't' for status of person2 if Covid transmitted, otherwise maintain existing status of person2
char simulate_direct_transmission(char person1_status, char person2_status)
{
    // If person1 is Covid Positive, simulate direct spread from person1 to person2
    if (person1_status == 't')
    {
        if (sample_event(1) && (person2_status == 'f')) // 1% chance of returning true
        {
            return 't'; //Set person2 status as Covid Positive
        }
    }
    return person2_status; //Maintain existing status of person2
}

// This function simulates transmission to staff while the covid positive patient is being moved into the secure isolation facility
// returns 't' if transmission occurred, otherwise maintain existing staff status
char simulate_move_transmission(char staff_status)
{
    // If person has covid, randomly simulate spread during movement of patient into secure isolation facility
    if (sample_event(20)) // 20% chance of returning true
    {
        return 't'; // Set staff status as Covid Positive
    }
    return staff_status; //Maintain existing status of staff
}

// This function isolates people who have status of Covid Detected
// returns 'i' as status of person if existing status of person is 'd'
char move_to_isolation(char status)
{
    if (status == 'd') // If person status is Covid Detected
    {
        return 'i'; // Set person status as Isolated
    }
        return status; // Mainting existing status of person
}

// This function simulates the chance of the public being exposed to Covid (50%) by a Covid positive released patient or staff member
// returning true if an exposure event occured or false otherwise
bool simulate_public_transmission(char status)
{
    if (status == 't') // If person status is Covid Positive
    {
        if (sample_event(50)) // 50% chance of returning true
        {
            return true;
        }
    }
    return false;
}

// This function releases the patients
void release_patients()
{
    printf("Bye bye everyone!\n");
}

int main()
{
    bool public_transmission; // Boolean variable to determine if public transmission occured

    // Code for patient or staff status
    // 'f' - Covid Negative, 
    // 't' - Covid Positive, 
    // 'd' - Covid Detected,
    // 'i' - Isolated

    char patient_status; // Variable to store status of patient
    char staff_status; // Variable to store status of staff

    srand(time(NULL)); // A function we call to start seeding random numbers
    int Ntrials = 10000; // Number of simulated trials to run.
    int Ntrials_exposure = 0; // A counter for the number of trials where Covid exposure to the public was predicted

     // Repeat the code Ntrials times
    for (int iter = 0; iter < Ntrials; iter++)
    {
        staff_status = 'f';
        public_transmission = false;
        patient_status = patient_arrives(); //record status of patient upon arrival
        /*--------------------------- Simulate daily flow over two week period-----------------------------------------------*/
        // Add your code here ....
        /*------------------------------------------------------------*/
        // Since the patient is still have not been quarentine for 14 days yet, we will move on
        // If not yet 14 days, run the loop
        int day;
        for(day = 1; day <= 14; day++) 
        {
            // Simulating aircon transmission
            patient_status = simulate_aircon_transmission(patient_status);
            staff_status = simulate_aircon_transmission(staff_status);

            // Simulating direct transmission
            patient_status = simulate_direct_transmission(patient_status,staff_status);
            staff_status = simulate_direct_transmission(staff_status,patient_status);

            // Testing the patient
            patient_status = covid_test(patient_status);
            
            // If statement to check whether patient is detected with covid or not,
            // Test the staff for covid for both condition
            if(patient_status == 'd')
            {
                patient_status = move_to_isolation(patient_status);
                staff_status = simulate_move_transmission(staff_status);
            }

            // Need to test for covid in patient regardless so there is no need for an else statement
            staff_status = covid_test(staff_status);

            // If statement to see if the staff is detected with covid or not
            if(staff_status == 'd')
            {
                staff_status = move_to_isolation(staff_status);
                public_transmission = simulate_public_transmission(staff_status);
                if(public_transmission == true)
                {
                    Ntrials_exposure++;
                }

            }
            else
            {
                public_transmission = simulate_public_transmission(staff_status);
                if(public_transmission == true)
                {
                    Ntrials_exposure++;
                }
            }
            
        }
     
    //After 14 days,the patients would be released
    public_transmission = simulate_public_transmission(patient_status);
    if (public_transmission == true)
    {
        Ntrials_exposure++;
    } 
       /*.............................................................*/
    }
    printf("\nThe probability of public transmission is approximately %2.2lf %%.\n", ((double)Ntrials_exposure / Ntrials) * 100.0);
    return 0;
}