// There are a few purpose that this code intends to do, for the sake of simplicity , the function of this code
// will go one by one

// The first function of the code (1) :
// Allow the user to enter new recipes (up to 5) to her burger category of her choice

// The second function of the code (2) / (3) :
// Allow the user to choose to display all recipes for a burger category or all recipes for all burger categories

// The third function of the code (4) :
// Allow the user to perform a search based on BREAD type and subsequently print out all recipes that contain that 
// BREAD type

// Code function will change based on the initial number inputted at the beginning and must exit from the code
// if not the code will keep on running

// Written by Tan Jin Chun
// Last modified : 28/3/2021

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Example of a recipe (Given Code)
struct BurgerRecipe
{
    char BreadType[10];
    char MeatType[10];
    int SaltPercent;
    float MagicIngredientGrams;
};

//Declare the required categories (Structures) 
//Maximum of 5 categories
struct BurgerRecipe celery[5];
struct BurgerRecipe oatmeal[5];
struct BurgerRecipe treebark[5];

// Psedocode

// Function 1
// Purpose of this function is to ask the user what they want to do based on numbers input
void askOption()
{
    printf("------------------------------------------------------------------------------------------\n");
    printf("Input 5 recipes to a burger category of your choice                                   (1)\n");
    printf("Display all recipes for A burger category                                             (2)\n");
    printf("Display all recipes for ALL burger category                                           (3)\n");
    printf("Make a search based on BREAD type and print out all recipes containing the bread type (4)\n");
    printf("Exit the Code                                                                         (5)\n");
    printf("------------------------------------------------------------------------------------------\n");
    printf("Which function of the code would you like to run? : ");

}

// Function 2
// Purpose of this function is to allow the user to enter new recipes to her burger category of 
// her choice
struct BurgerRecipe* *addRecipe(struct BurgerRecipe* *allRecipe,int category , int *numRecipe)
{
    // Asking the user for the respective ingredients for a total of 5 times (5 Recipes) and that will 
    // be a recipe
    if(*numRecipe < 5) {
        printf("Enter the Bread type: ");
        scanf("%s", allRecipe[category][*numRecipe].BreadType);
        printf("Enter the Meat type: ");
        scanf("%s", allRecipe[category][*numRecipe].MeatType);
        printf("Enter the salt percentage: ");
        scanf("%d", &allRecipe[category][*numRecipe].SaltPercent);
        printf("Enter the value of magic ingredients in grams: ");
        scanf("%f", &allRecipe[category][*numRecipe].MagicIngredientGrams);
        *numRecipe += 1;
    } 
    // If the maximum number of recipes has been achieved. Stop the program
    else if(*numRecipe > 5) 
    {
        printf("Maximum Recipes Input has been achieved\n");
    }

    return allRecipe;
} 

// Function 3
// The purpose of this function is to display the all recipes for a burger category
void displayCategory(struct BurgerRecipe*burgers, int numBurgers , char categoryName[]) 
{
    // Displaying the categories of the burgers that are available
    printf("\n%s Burgers Category: \n", categoryName);

    // Initialising the variable
    int i = 0;

    // If there is no burger in the category
    if(numBurgers == 0) 
    {
        printf("No burgers can be found in this category\n\n");
    }

    // Displaying the recipes using a for loop
    for( i = 0; i < numBurgers ; i++) 
    {
        printf("Burger Recipe %d\n", i+1);
        printf("Bread Type: %s\n", burgers[i].BreadType);
        printf("Meat Type: %s\n", burgers[i].MeatType);
        printf("Salt Percent: %d%%\n", burgers[i].SaltPercent);
        printf("Magic Ingredient Grams: %.2f g\n\n", burgers[i].MagicIngredientGrams);
    }
}

// Function 4
// The purpose of this function is to allow the user to perform a search based on BREAD type
// and print out all recipes that contain that BreadType

void searchBurgerRecipes(struct BurgerRecipe**allBurgers, int numBurgers[] , char bread[]) 
{
    int i = 0; // Counter for categories
    int j = 0; // Counter for 
    int k = 0; // Counter for recipe

    // Using a for loop to go through the categories (3 categories)
    for(i = 0; i < 3; i++)
    {
        // Comparing two strings together , one string from the bread type and the other one inputted by the user
        // Using a for loop to go through each of the string to see whether each one of the string is 
        // matched or not
        for(j = 0; j < numBurgers[i]; j++) 
        {
            // Using an if statement for logical execution of action
            // If the bread type matches ....
            // Display the recipe

            if(strcmp(allBurgers[i][j].BreadType, bread) == 0) {
                printf("\nRecipe %d\n", k+=1);
                printf("Bread Type: %s\n",allBurgers[i][j].BreadType);
                printf("Meat Type: %s\n",allBurgers[i][j].MeatType);
                printf("Salt Percent : %d%%\n",allBurgers[i][j].SaltPercent);
                printf("Magic Ingredient in Grams: %.2f g\n\n",allBurgers[i][j].MagicIngredientGrams);

                // A counter to count how many recipes contain the particular bread type wanted by 
                // the user
                k += 1;
            }
        }
    }
    // If no recipes are found ...
    if(k = 0)
    {
        printf("No burgers has been found with this bread type\n\n");
    }
}


// Main Function
int main() {

    // Defining 2-d array to group all of the categories
    struct BurgerRecipe** allRecipe;
    allRecipe = (struct BurgerRecipe**)malloc(sizeof(struct BurgerRecipe*)*3);
    allRecipe[0] = celery;
    allRecipe[1] = oatmeal;
    allRecipe[2] = treebark;

    // Defining the number of burgers in each category
    int numBurgers[3];
    int i;

    // Setting the number of recipes for each category as 0
    for(i = 0; i < 3; i++) 
    {
        numBurgers[i] = 0;
    }

    // Declaring the rest of the variable
    int option = 0;
    int category = 0;
    int numRecipe = 0;
    char catName[20];
    char bread[20];

    // Will have to keep on repeating until option 5 is used by the user 
    // Using a do-while loop for this purpose
    do 
    {
        // Asking the user which option that the user wants to execute
        askOption();
        scanf("%d", &option);

        // Using a switch statement to carry out the option that is wanted by the user
        switch(option)
        {
            // The First Option
            case 1:
            printf("Celery    (1)\n");
            printf("Oatmeal   (2)\n");
            printf("Tree Bark (3)\n");
            printf("Choose a category(1-3): ");
            scanf("%d", &category);
            while(category<1 || category>3)
            {
                printf("Invalid Choice\n");
                printf("Celery    (1)\n");
                printf("Oatmeal   (2)\n");
                printf("Tree Bark (3)\n");
                printf("Choose a category(1-3): ");
                scanf("%d", &category);
            }
            category--;
            allRecipe = addRecipe(allRecipe,category,&numBurgers[category]);
            break;

            // The Second Option
            case 2:
            printf("Celery    (1)\n");
            printf("Oatmeal   (2)\n");
            printf("Tree Bark (3)\n");
            printf("Choose a category(1-3): ");
            scanf("%d", &category);

            // Using a while loop to check that the category condition is met, if not the code will
            // keep on running
            while(category<1 || category>3)

            {
                printf("Invalid Choice\n");
                printf("Celery    (1)\n");
                printf("Oatmeal   (2)\n");
                printf("Tree Bark (3)\n");
                printf("Choose a category(1-3): ");
                scanf("%d", &category);
            }
            category--;
            if(category == 0)
            {
                strcpy(catName, "Celery");
            }
            else if(category == 1)
            {
                strcpy(catName, "Oatmeal");
            }
            else if (category == 2)
            {
                strcpy(catName, "Tree Bark");
            }
            displayCategory(allRecipe[0], numBurgers[category], catName);
            break;
            
            // The Third Option 
            case 3:
            displayCategory(allRecipe[0], numBurgers[0], "Celery");
            displayCategory(allRecipe[1], numBurgers[1], "Oatmeal");
            displayCategory(allRecipe[2], numBurgers[2], "Tree Bark");
            break;
            
            // The Fourth Option
            case 4:
            printf("Enter the bread type: ");
            scanf("%s", bread);
            searchBurgerRecipes(allRecipe, numBurgers, bread);
            break;

            // The Fifth Option
            case 5:
            break;

            // Default Option if user type in a number other than the number (1-5)
            default:
            printf("Invalid Option\n");
        }

    }
while(option != 5);

// End of the code
    return 0;

}