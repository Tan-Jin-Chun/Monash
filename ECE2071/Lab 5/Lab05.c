// Written by Tan Jin Chun
// Student ID : 32194471
// Last Modified : 10/4/2021
// The purpose of this source code is to keep the record of the popularity of each recipe
// The source code will carry out multiple function which includes :
// 1) Allocate memory for a new node and populate its values and insert the created node into the linked list(text file)
// 2) Deletes a particular node from the linked list
// 3) Seaches for the popularity of the recipe
// 4) Saves the entire linked list to a file
// 5) Prints the entire linked list onto the console
// 6) Sort the linked list by popularity
// 7) Exit from the source code

#include <stdio.h>
#include <string.h>
#include "stdlib.h"
#include "malloc.h"

// Given Code
struct recipe 
{
char *name;
int popularity;
struct recipe *next;
};
typedef struct recipe BURGER;

// Pointer to the start of the linked list
BURGER *header;

// Initialising the variable
char name[30];
char filename[50];
int popular;

// FILE will declare the file pointer (handle and keep track of files)
FILE *fptr;

// The list of the 7 functions made
BURGER *make_node(char *name, int popularity);
void insert_node();
void delete_node();
void search_node();
void print_list();
void output_list();
void sort_linked_list();
void swap(BURGER *first, BURGER *second);

// The main function
int main()
{
    // Pointer to the start of the linked list
    int choice;
    BURGER *p, *q;
    q = NULL;
    printf(" Enter the input file name: ");
    scanf("%s", filename);
    fptr= fopen(filename, "r");
    if (fptr == NULL)
        printf("Error, unable to open the inputted file %s \n", filename);
    else
    {
        while (!feof(fptr))
            {
        
                fscanf(fptr," %s %d ", name, &popular);
                printf("%s %d\n",name, popular);
                p=make_node(name, popular);
                p->next= q;
                q=p;
        
            }
            printf("Created the Linked List\n");
            header = q;
            fclose(fptr);
                
            // A do while loop
            do 
            {
                printf("\n\n MENU \n\n");
                printf("1. Insert\n");
                printf("2. Delete\n");
                printf("3. Search\n");
                printf("4. List\n");
                printf("5. Save\n");
                printf("6. Sort List by Popularity\n");
                printf("7. Quit\n");
                printf("\n");

                // Prompting the user
                printf("Enter your choice: ");
                scanf("%d", &choice);

                // Switch Cases 
                switch(choice)
                {
                    case 1:
                        insert_node();
                        break;
                    case 2:
                        delete_node();
                        break;
                    case 3:
                        search_node();
                        break;
                    case 4:
                        print_list();
                        break;
                    case 5:
                        output_list();
                        break;
                    // the extra function created
                    case 6:
                        sort_linked_list();
                        break;
                    dafault: 
                        printf("Please only select number from 1-7");
                        break;
                }
            }while (choice !=7);
        
        
            
    }
    return 0;
}

/***************************************************************/
// Main Coding Starts Here
// The first made function  (Extra Functions)
// The purpose of this function is to sort the list by decreasing popularity(Highest to Lowest)

void sort_linked_list()
{
    // Initialising the variables
    int change, i;
    BURGER *ptr1;
    BURGER *lptr = NULL;
    
    if (header == NULL)
    return;
    
    do
    {
        change = 0;
        ptr1 = header;
        
        while (ptr1->next != lptr)
        {
            if (ptr1->popularity < ptr1->next->popularity)
            {
                swap(ptr1, ptr1->next);
                change = 1;
                }
                ptr1 = ptr1->next;
                }
                lptr = ptr1;
            }
    while (change);
    printf(" \nThe list has been sorted by popularity\n ");
}

// The created swap function will swap the name based on the popularity(highest to lowest)
void swap(BURGER *first, BURGER *second)
{
    // Initialising the variable
    int temp = first->popularity;
    char *temp_name = malloc(100*sizeof(char));

    // Copying the name
    strcpy(temp_name ,first->name);
    first->popularity = second->popularity;
    strcpy(first->name ,second->name);
    second->popularity = temp;
    strcpy(second->name ,temp_name);
}

/***************************************************************/
// The first given skeleton function
// The purpose of this function is to create/make a new category(node)
// This function will be used in the second function(insert_node function)

BURGER *make_node(char *name, int popularity)
{
    BURGER *ptr;
    
    // Insert your code here.
    // Allocating memory
    ptr = malloc(sizeof(BURGER));

    // Using an if statement 
    if (ptr != NULL)
    {
        // Insert your code here
        ptr->name = malloc(strlen(name) + 1);
        strcpy(ptr->name ,name);
        ptr->popularity = popularity;
        ptr->next = NULL;
        return(ptr);
    }
    else
    {
        printf("Memory not allocated\n");
        return(ptr);
    }
  
}
/************************************************************/
// The second given skeleton function
// The purpose of the function is to insert a new node
// The first option in the command prompt

void insert_node()
{

    BURGER *tp1;

    printf("Enter the details of record to be inserted in the format as\n");
    printf("<name> <popularity>\n");
    // Insert your code here

    // Allocating memory for BURGER
    tp1 = malloc(sizeof(BURGER));
    scanf("%s %d",name,&popular);

    // Using the function from above
    tp1 = make_node(name,popular);

    // Using an if statement 
    if (header == NULL)
    {
        header = tp1;
    }
    else
    {
        tp1->next = header;
        header = tp1;
    }

    printf("\n New categories has been inserted at the start of the list\n");
}
/************************************************************/
// The third given skeleton function
// The purpose of the function is to delete a node
// The second option in the command prompt

void delete_node()
{

    BURGER *tp1, *tp2;
    int flag;
    char name[30];

    printf("Enter the recipe's name to be deleted\n");

    // Insert your code here.
    //The current node we are comparing with user input
    tp1 = header; 

    //Stored name with the desired deleted node
    scanf("%s", name); 

    //Deleting first node
    if (tp1 != NULL) 
    {
        if (!strcmp(name, tp1->name)) 
        {
            header = tp1->next;
            free(tp1);
            flag = 1;
        }
    }
        while (tp1 != NULL && flag == 0) 
        {
            if (tp1->next != NULL) 
            {
                if (!strcmp(name, tp1->next->name)) 
                {
                    tp2 = tp1->next;
                    tp1->next = tp1->next->next;
                    free(tp2);
                    flag = 1;
                    break;
                }
        }
        tp1 = tp1->next;
    }
    // Given code
    if (flag)
    {
        printf("The node has been deleted from the linked list\n");
    }
    else
    {
        printf("The node to be deleted is not in the linked list\n");
    }

}
/***********************************************************/
// The fourth given skeleton function
// The purpose of the function is to search a node for the popularity of the recipe
// The third option in the command prompt

void search_node()
{

    // Given code
    BURGER *tp1;

    char name[30];
    int flag = 1;
    tp1 = header;

    printf("Please enter the name of the recipe for the node you would you like to search:\n");

    //The stored name with the desired deleted node
    scanf("%s", name); 


    while (tp1 != NULL) 
    {
        if (!(strcmp(name, tp1->name))) 
        {
            flag++;
            printf("\n\nCategory: %s  Popularity: %d\n\n", tp1->name, tp1->popularity);
            break;
        }
            tp1 = tp1->next;
            flag++;
        }

    if (!flag) 
    {
        printf("The category is not in the linked list\n");
    }
  
}
/**********************************************************/
// The fifth given skeleton function
// The purpose of the function is to save the changes made to the text file
// The fifth option in the command prompt

void output_list()
{
    // Given Code
    BURGER *p1;

    fptr = fopen(filename, "w");

    // Insert your code here.
    p1 = header;

    // Error checking
    if (fptr == NULL)
        printf("Error, the inputted file cannot be opened %s \n", filename);
    else 
    {
        
        while(p1 != NULL)
        {
            fprintf(fptr,"%s %d\n",p1->name, p1->popularity);
            p1 = p1->next;
        }
         printf(" The list has been saved successfully %s",filename);

         // Given code
        fclose(fptr);
    }
    
}
/********************************************************/
// The sixth given skeleton function
// The purpose of the function is to output the entire list (show the text file)
// The fourth option in the command prompt

void print_list()
{
    // Given code
    BURGER *p1;

    // Insert your code here.
    p1 = header;
    while(p1->next != NULL)
    {
        printf("%s %d --> ",p1->name, p1->popularity);
        p1 = p1->next;
    }

    printf(" %s %d ",p1->name, p1->popularity);
    
}
/********************************************************/