"""
Template for Programming Assignment FIT1045 - S2 2021
Sudoku

Version 2 (2021-08-13)

Sudoku boards partially retrieved from
- https://puzzlemadness.co.uk
- https://sudokudragon.com
"""

########### Sudoku boards ##############################

small = [[1, 0, 0, 0],
         [0, 4, 1, 0],
         [0, 0, 0, 3],
         [4, 0, 0, 0]]

small2 = [[0, 0, 1, 0],
          [4, 0, 0, 0],
          [0, 0, 0, 2],
          [0, 3, 0, 0]]

big = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
       [4, 0, 0, 7, 8, 9, 0, 0, 0],
       [7, 8, 0, 0, 0, 0, 0, 5, 6],
       [0, 2, 0, 3, 6, 0, 8, 0, 0],
       [0, 0, 5, 0, 0, 7, 0, 1, 0],
       [8, 0, 0, 2, 0, 0, 0, 0, 5],
       [0, 0, 1, 6, 4, 0, 9, 7, 0],
       [0, 0, 0, 9, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 3, 0, 0, 0, 2]]

big2 = [[7, 0, 0, 0, 0, 0, 0, 1, 0],
        [0, 5, 0, 0, 0, 9, 0, 0, 0],
        [8, 0, 0, 0, 3, 0, 0, 4, 0],
        [0, 0, 0, 7, 6, 0, 0, 0, 8],
        [6, 2, 0, 0, 5, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 3, 0, 7, 0],
        [0, 0, 0, 6, 0, 0, 9, 8, 0],
        [0, 0, 0, 0, 2, 7, 3, 0, 0],
        [0, 0, 2, 0, 8, 0, 0, 5, 0]]

big3 = [[0, 0, 8, 1, 9, 0, 0, 0, 6],
        [0, 4, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 7, 6, 0, 0, 1, 3, 0],
        [0, 0, 6, 0, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 8, 0, 0, 0, 0],
        [4, 0, 0, 0, 0, 2, 0, 0, 5],
        [0, 0, 0, 0, 3, 0, 9, 0, 0],
        [0, 1, 0, 4, 0, 0, 0, 0, 2],
        [0, 0, 0, 0, 0, 0, 0, 5, 7]]

big4 = [[0, 0, 0, 6, 0, 0, 2, 0, 0],
        [8, 0, 4, 0, 3, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 9, 0, 0, 0],
        [4, 0, 5, 0, 0, 0, 0, 0, 7],
        [7, 1, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 3, 0, 5, 0, 0, 0, 8],
        [3, 0, 0, 0, 7, 0, 0, 0, 4],
        [0, 0, 0, 0, 0, 1, 9, 0, 0],
        [0, 0, 0, 2, 0, 0, 0, 6, 0]]

giant = [[ 0,  0, 13,  0,  0,  0,  0,  0,  2,  0,  8,  0,  0,  0, 12, 15],
         [ 7,  8, 12,  2, 10,  0,  0, 13,  0,  0, 14, 11,  6,  9,  0,  4],
         [11, 10,  0,  0,  0,  6, 12,  5,  0,  3,  0,  0,  0, 14,  0,  8],
         [ 1,  0,  0,  0, 14,  0,  2,  0,  0,  4,  6,  0, 16,  3,  0, 13],
         [12,  6,  0,  3,  0,  0, 16, 11,  0, 10,  1,  7, 13, 15,  0,  0],
         [ 0, 13,  0,  0,  0, 15,  8,  0, 14,  0,  0,  0,  0, 16,  5, 11],
         [ 8,  0, 11,  9, 13,  0,  7,  0,  0,  0,  0,  3,  2,  4,  0, 12],
         [ 5,  0,  0, 16, 12,  9,  0, 10, 11,  2, 13,  0,  0,  0,  8,  0],
         [ 0,  0,  0,  0, 16,  8,  9, 12,  0,  0,  0,  0,  0,  6,  3,  0],
         [ 2, 16,  0,  0,  0, 11,  0,  0,  7,  0, 12,  6,  0, 13, 15,  0],
         [ 0,  0,  4,  0,  0, 13,  0,  7,  3, 15,  0,  5,  0,  0,  0,  0],
         [ 0,  7,  0, 13,  4,  5, 10,  0,  1,  0, 11, 16,  9,  0, 14,  2],
         [ 0,  2,  8,  0,  9,  0,  0,  0,  4,  0,  7,  0,  0,  5,  0,  0],
         [14,  0,  0,  0, 15,  2, 11,  4,  9, 13,  3,  0, 12,  0,  0,  0],
         [ 0,  1,  9,  7,  0,  0,  5,  0,  0, 11, 15, 12,  0,  0,  0,  0],
         [16,  3, 15,  0,  0, 14, 13,  6, 10,  1,  0,  2,  0,  8,  4,  9]]

giant2 = [[ 0,  5,  0,  0,  0,  4,  0,  8,  0,  6,  0,  0,  0,  0,  9, 16],
          [ 1,  0,  0,  0,  0,  0,  0, 13,  4,  0,  0,  7, 15,  0,  8,  0],
          [13,  0,  0,  0,  0,  7,  3,  0,  0,  0,  0,  9,  5, 10,  0,  0],
          [ 0, 11, 12, 15, 10,  0,  0,  0,  0,  0,  5,  0,  3,  4,  0, 13],
          [15,  0,  1,  3,  0,  0,  7,  2,  0,  0,  0,  0,  0,  5,  0,  0],
          [ 0,  0,  0, 12,  0,  3,  0,  5,  0, 11,  0, 14,  0,  0,  0,  9],
          [ 4,  7,  0,  0,  0,  0,  0,  0, 12,  0, 15, 16,  0,  0,  0,  0],
          [ 0,  0,  0,  0, 14,  0, 15,  0,  6,  9,  0,  0,  0,  0, 12,  0],
          [ 3,  0, 15,  4,  0, 13, 14,  0,  0,  0,  0,  1,  0,  0,  7,  8],
          [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  9, 10,  0,  0,  0,  0],
          [11,  0, 16, 10,  0,  0,  0,  0,  0,  7,  0,  0,  0,  3,  5,  0],
          [ 0,  0, 13,  0,  0,  0,  0,  0, 14,  0, 16, 15,  0,  9,  0,  1],
          [ 9,  0,  2,  0,  0, 14,  0,  4,  8,  0,  0,  0,  0,  0,  0,  0],
          [ 0, 14,  0,  0,  0,  0,  0, 10,  9,  0,  3,  0,  0,  0,  1,  7],
          [ 8,  0,  0,  0, 16,  0,  0,  1,  2, 14, 11,  4,  0,  0,  0,  3],
          [ 0,  0,  0,  1,  0,  0,  5,  0,  0, 16,  0,  6,  0, 12,  0,  0]]

giant3 = [[ 0,  4,  0,  0,  0,  0,  0, 12,  0,  1,  0,  0,  9,  0,  8,  0],
          [15, 14,  0,  0,  9,  0,  0, 13,  8,  0,  0, 10,  1,  0,  0,  0],
          [ 0,  7,  0,  0,  0,  0,  0,  8, 16,  0, 14,  0,  0,  2,  0,  0],
          [ 0,  0,  0,  9,  0,  0, 11,  0,  0,  0,  0,  0,  5,  0,  0, 15],
          [ 3,  0, 12,  0,  7,  0, 10,  0,  0, 11,  2,  0,  0,  0,  0,  6],
          [14,  8,  0,  0,  0, 12,  0,  6,  0,  0,  0, 16,  0,  0,  0, 10],
          [ 0, 16,  0,  0, 13,  0,  0,  0,  0,  0,  0,  0,  0,  0, 12,  0],
          [ 6,  0,  0,  0,  0,  8,  0,  5,  1,  7, 13,  0, 11,  0,  0, 14],
          [ 0,  0,  0,  2,  0,  0, 16,  0, 15, 12,  0,  3, 10,  7,  0,  0],
          [ 0,  9,  0,  5, 11,  0,  3,  0,  4, 13, 16,  0,  0, 15,  6,  0],
          [ 0,  0,  0,  0,  5,  4,  0,  0,  9,  6,  0,  2,  0,  0,  0,  0],
          [ 1,  0,  0,  0,  0, 15, 12,  0,  0,  0,  5,  0,  0,  0,  9,  0],
          [12, 10,  0, 15,  0,  1,  0,  0,  2,  9,  3,  4,  0,  0,  5,  0],
          [ 0,  0,  0,  3, 10,  0,  4,  0,  0, 15,  0,  0,  0,  0,  0,  0],
          [ 0,  0,  0,  0, 16,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10, 11],
          [11,  6,  8,  0,  0,  0, 15,  0, 14,  0,  0,  0,  0, 13,  0,  2]]

sudokus = [[], [], [small, small2], [big, big2, big3, big4], [giant, giant2, giant3]]

########### Module functions ###########################
# Importing The Required Functions which is sqrt and deepcopy
from math import sqrt
from copy import deepcopy

# The First Function
def print_board(board):
    """
    Prints a given board to the console in a way that aligns the content of columns and makes
    the subgrids visible.

    Name: print_board
    Purpose: Print the sudoku board in the required manner
    Input : a Sudoku board (board) of size 4x4, 9x9, or 16x16
    Effect: prints the board to the console 

    For example:

    >>> print_board(small2)
    -------
    |  |1 |
    |4 |  |
    -------
    |  | 2|
    | 3|  |
    -------
    >>> print_board(big)
    -------------
    |   |   |   |
    |4  |789|   |
    |78 |   | 56|
    -------------
    | 2 |36 |8  |
    |  5|  7| 1 |
    |8  |2  |  5|
    -------------
    |  1|64 |97 |
    |   |9  |   |
    |   | 3 |  2|
    -------------
    >>> print_board(giant2)
    ---------------------
    | 5  | 4 8| 6  |  9G|
    |1   |   D|4  7|F 8 |
    |D   | 73 |   9|5A  |
    | BCF|A   |  5 |34 D|
    ---------------------
    |F 13|  72|    | 5  |
    |   C| 3 5| B E|   9|
    |47  |    |C FG|    |
    |    |E F |69  |  C |
    ---------------------
    |3 F4| DE |   1|  78|
    |    |    |  9A|    |
    |B GA|    | 7  | 35 |
    |  D |    |E GF| 9 1|
    ---------------------
    |9 2 | E 4|8   |    |
    | E  |   A|9 3 |  17|
    |8   |G  1|2EB4|   3|
    |   1|  5 | G 6| C  |
    ---------------------
    """

    """
    Thought Process:
    # So we need to insert a ---- line when we start and repeat that every k times, so there should be around
    # k + 1 lines for each of the displayed sudoku board. This goes the same not only for the horizontal part
    # but also for the vertical part. The 0 will be replaced with an empty space, so it is replaced with a 
    # empty string ' '. So it will kind of split every k times to form it's own separate sudoku board

    # First, we must get the length of the sudoku board that we are dealing with 
    # Both Sides are the same since the input can only be 4x4, 9x9 or 16x16

    # Algorithm for printing the horizontal line, if u notice closely, the number of dashed line would be equivalent to the total
    # numbers of | and the number in the board itself.
    # This could be generalise into (n*n+(n+1)) ///
    # Now how is the equation formed above? Taking the small board for an instance, the board length is 4,
    # the subgrid for it is 2 (sqrt(4)) , number of lines = 2(numbers) + 2(numbers) + (2+1) . That one includes the extra line
    # Initialising the variable

    # After getting the algo for the dashed lines, now we need to determine how to loop through the table without getting
    # index out of range, so , we use a few indicators to help us, the row of the table should only be iterated only when
    # the '|' symbol is found (only for the borders) 

    # Need to use end = '' to connect the variable, forgot about this
    """

    # Initialising the variable
    # Getting the size of the given board
    length_board = len(board)
    
    # Getting the size for each subgrid
    subgrid = int(sqrt(length_board))

    # Algorithm found (the size for our printed board)
    algo = (subgrid * subgrid) + (subgrid + 1)

    # Variable to know which position will have a border 
    upper_border = 0

    # Variable for board row index
    # We must create a separate index in order to iterate through the row and column in the given board
    # Cannot use i in range(0, algo) since this will iterate out of the index of the board itself, not for the board that is going to be
    # printed, so we must increment it only after we have assigned a value to the board and dont increment when we add a upper border (for row)
    # and inner border (for col)
    row_index = 0
    
    # Going through the row of our printed board
    for i in range(0, algo):
        
        # Check to see if we need to add a upper border or not
        if(i == upper_border):

            # Print the upper border based on the total number of times that the inner border and the number occurs (value of algo)
            print('-' * algo)

            # Increment to the next position where we need to add another border
            upper_border = subgrid + upper_border + 1
        
        # If the upper board is not found
        else:
            
            # Initialising the variable
            # Variable to find which position will have a border
            # Reset the value of inner border back to zero after iterating through a row
            inner_border = 0

            # Variable for board column index
            # Explanation goes for the same for the row_index
            col_index = 0

            # Iterate the column of the printed board
            for j in range(0, algo):

                # If the index is equal to the value of the border that we have incremented, add a border
                if j == inner_border:

                    # Print the inner border
                    print('|', end = '')

                    # Increment to the next position of the border
                    inner_border = subgrid + inner_border + 1

                # If we dont need to add the border, then it probably is the actual digit that we need to add
                else:

                    # If item is 0, print space
                    if(board[row_index][col_index] == 0):
                        print(' ', end = '')

                    # If the value is not 0
                    else:

                        # If value is * , print * (for the hints function)
                        if (board[row_index][col_index] == '*'):
                            print('*', end = '')

                        # Else, do the usual operation
                        else:

                            # If item is less than 10, print as it is
                            if board[row_index][col_index] < 10:
                                print(board[row_index][col_index], end = '')

                            # Using hexadecimal in Python since 10 to 15 is A to F and get the last letter, if not will print 0xa
                            # .upper() to capitalize the letter so that it can display according to the marking scheme
                            if board[row_index][col_index] > 9 and board[row_index][col_index] < 16:
                                print(hex(board[row_index][col_index])[-1].upper(), end = '')

                            # If the value is 16, print G
                            if board[row_index][col_index] == 16:
                                print('G', end = '')
                            
                    # Increment the column index by 1 (iterating through that particular row by updating the column)
                    col_index = col_index + 1

            # Increment the row index by 1 (after going through one row)
            row_index = row_index + 1

            # Print new line
            print()

    # Given code
    #print(board)


# The second function
def subgrid_values(board, r, c):
    """
    Name: subgrid_values
    Purpose: Find all of the values that are not zero in the subgrid
    Input : Sudoku board (board), row index (r), and column index (c)
    Output: list of all numbers that are present in the subgrid of the board related to the
            field (r, c)

    For example:

    >>> subgrid_values(small2, 1, 3)
    [1]
    >>> subgrid_values(big, 4, 5)
    [3, 6, 7, 2]
    >>> subgrid_values(giant2, 4, 5)
    [7, 2, 3, 5, 14, 15]
    """
    pass

    """
    Thought Process:
    For this function, we want to extract the values that can be found in the subgrid based on the value of the 
    row and column given by the user (any row and col value that falls in a particular subgrid). First, we must use
    modulo to find the remainder of both of the row and the column based on the square roots of the board and use that value to subtract
    both the row and the column (subtract that value by the remainder of the above operation) to get the starting point of
    the row and column where the subgrid starts. We can then loop through the subgrid at the specific point found and get all of the
    values in the subgrid.
    """
    # Let's utilise the modulus to see which subgrid that the user is currently located and then do the appriopriate action
    # when a certain modulus value (remainder value is acheived). 

    # Initialisng the variable
    sqrt_length = int(sqrt(len(board)))

    # Use a for loop and an if statement to loop through the index of the table
    for i in range(sqrt_length):
        
        # Using an if statement to compare the row value first, must modulo the comparison also since that value will keep on accumulating
        if r % sqrt_length == i:

            # Must decrement by that number so that u could go to the starting row of that subgrid
            store_val = i
            r -= store_val

            # Break out from the loop once the condition has been acheived
            break

    # Repeat the above process for the col
    # Use a for loop and an if statement to loop through the index of the table
    for j in range(sqrt_length):
        
        # Using an if statement to compare the col value
        if c % sqrt_length == j:

            # Must decrement by that number so that u could go to the starting row of that subgrid
            store_val2 = j
            c -= store_val2

            # Break out from the loop once the condition has been acheived
            break

    # Must initialise a list first in order to store the value
    lst = []

    # Now , we can use the correct starting point for that subgrid and loop through the subgrid more easily and obtain the required values
    # Using two for loop to loop through the table
    # Loop from the starting point of the subgrid to the end of the row of that subgrid which is just sqrt_length
    for l in range(r, (r + sqrt_length)):

        # Looping through the column now
        for k in range(c, (c + sqrt_length)):

            # Appending the value into a list
            # If it is not equal to the value of zero then only append
            if board[l][k] != 0:

                # Appending the value into the list
                lst.append(board[l][k])

    # Return back the lst
    return lst

# The third function
# I changed the i and j in the input paramter to r and c (for convienience sake)
def options(board, r, c):
    """
    Name: options
    Purpose: Find all of the possible options that are available in that position
    Input : Sudoku board (board), row index (r), and column index (c)
    Output: list of all numbers that player is allowed to place on field (r, c),
            i.e., those that are not already present in row r, column c,
            and subgrid related to field (r, c)

    For example:

    >>> options(small2, 0, 0)
    [2, 3]
    >>> options(big, 6, 8)
    [3, 8]
    >>> options(giant2, 1, 5)
    [2, 5, 6, 9, 11, 12, 16]
    """
    pass

    """
    Thought Process:
    Firstly, we go through the row that has been specified by the user and extract all of the non-zero values and then store it 
    in a list that we have created. We then get the values in the subgrid and store all of the non-zero values and the values that 
    are present in our current list. We then go through the column of the specified index and repeat the same process again, which is
    storing all of the non-zero value if and only if that value is not in our current list. We will then have all of the values in the list
    that are present in the rows, columns and the subgrid at the specified index. We then have to extract all of the values from 1 to 
    the size of the board that are not in that list in order to obtain the options of numbers that are not in that list

    Note:
    This function utilizes the subgrid_values function that we have created above
    """

    # Initialising the variables
    length_board = len(board)

    # Varible to store all of teh number found
    lst = []

    # Variable to keep all of the other numbers
    new_lst = []

    # So first, we loop through the values in that particular row first and extract those values if it is not equal to zero
    for i in range(length_board):

        # Using an if statement to compare the two values
        if board[r][i] != 0:
            
            # Append that value into the list
            lst.append(board[r][i])

    # After getting that lst, use another for loop, this time to get the value that are different from the values in the list
    # If the values is either the same as those in the lst or it is zero, then we can omit that value

    # Can compare at the same time for the values in the subgrid as well
    # Getting the values in the subgrid
    subgrid_val = subgrid_values(board, r, c)

    # Using a for loop to loop through my list
    for j in range(length_board):

        # If the value is not equal to zero , just put it in and also not in our current list
        if board[j][c] != 0 and board[j][c] not in lst:

            # Append it into the list
            lst.append(board[j][c])

    # Using another two for loop, this time to compare between the subgrid values and the lst
    for k in range(len(subgrid_val)):

        # Using an if statement to compare between the two values
        if subgrid_val[k] not in lst:
                lst.append(subgrid_val[k])
    
    # Now , we only got the value that SHOULD NOT BE AN Option, now we check to see if the number 1 to 9 is in the list
    for z in range(1,(length_board+1)):

        # If it is not in the list, then add it into the new list (list where the only valid values that can be inputted by the user)
        if z not in lst:
            new_lst.append(z)

    # Returning back the value in the new_list
    return new_lst



# The fourth function
# New function (hints function)
def hints(board):
    """
    Name: hints
    Purpose: Give hints to the user based on the algorithm come up by the maker
    Input: board
    Output: hints (an arterisk * in a certain position of the board and the corrdinates of the hint)
    """

    """
    Thought Process:
    In order to give hints to the user, we need to loop through each position of the sudoku board and find the total amount of options
    that we have in any particular position. If we have the least amount of options (length of the list produced by the options function)
    at that position, then that position will likely be solved more easily by the user.

    Note:
    This function utilizes the options function that we have created above
    """

    # Initialising the variable
    length_board = len(board)
    length_lst = len(board)
    lst = []

    # Storing the index of the position which has the least amount of options
    store_row = 0 
    store_col = 0

    # Looping through the board (through the rows first)
    for i in range(length_board):

        # Looping through the columns
        for j in range(length_board):

            # Calling the options function
            lst = options(board, i, j)

            # Finding the length of the lst
            length_new_lst = len(lst)

            # Using an if statement to compare the length of the list and to see if that position has a number already or not or an asterisk
            if board[store_row][store_col] != 0 and board[store_row][store_col] != '*':

                # Then only u store the value if the length_lst > length_new_lst
                if length_lst > length_new_lst:
                    store_row = i
                    store_col = j

                    # Assigning the length_new_lst to length_lst
                    length_lst = length_new_lst

            # Resetting the value of the lst
            lst = []

    # Setting the asterisk at a position in the board
    board[store_row][store_col] = '*'

    # Returning back the row, col and board with the asterisk at a certain position
    return store_row, store_col, board


# The fifth function (checking if the sudoku board contains no zeros at all)
def check(board):
    """
    Name: check
    Purpose: Check whether the all of the input of the board is full or not
    Input : board (Sudoku board)
    Output: bool_value (a boolean value)
    """

    # First we assume that the board is solved, so just assign a bool value of True to initialise our variable
    bool_value = True

    # Getting the length of the board
    length_board = len(board)

    # Looping through the board twice
    for i in range(length_board):

        # Looping through the column
        for j in range(length_board):

            # Using an if statement
            if board[i][j] == 0:
                
                # Return False if any one of our value is 0
                bool_value = False

    # Returning the bool value
    return bool_value


# The sixth function
def play(board):
    """
    Name: play
    Purpose: Allows the user to interactive/play with the sudoku boards
    Input : Sudoku board
    Effect: Allows user to play board via console
    """

    # Printing the board
    print_board(board)

    # Will continue to run an infinite loop until the user solves the sudoku
    while True:
        ## My Code

        # Using an if statement to check if any of the values are zero in the board, if not , print a success message
        if check(board):

            # Printing a success message , otherwise, continue the usual operation
            print("The sudoku is solved!")

            # Finish executing the sudoku board
            return

        else:

            # Else, continue the functions (I just indented the below lines of code into an else block)
            ## End of My Code
            # Separating the input into a list and splitting the into into three individual elements
            inp = input().split(' ')

            # If the length of the input is 3 and the elements in the list are numbers
            if len(inp) == 3 and inp[0].isdecimal() and inp[1].isdecimal() and inp[2].isdecimal():

            # Extracting those elements into three separate variables which is variable i , j and k

            # Index of the row of the board
                i = int(inp[0])

                # Index of the column of the board
                j = int(inp[1])

                # Value that u want to set at board[i][j] position
                x = int(inp[2])

                ## My Code Starts Here (Checking if the value of x is a valid value)
                
                # If the board is empty , then only execute the below function, if not , return a message to the user
                # Only setting the value if board[i][j] == 0, if not invalid input
                if board[i][j] == 0 or board[i][j] == '*':

                    # Using options to check whether if x is a valid input or not
                    lst = options(board, i, j)

                    # Using an if statement to compare the values of x
                    if x not in lst:

                        # Printing out an error message
                        print("Invalid Input of x")

                    # The while loop will be restarted again and the whole process will begin by itself again

                    else:
                            ## Saving the board into another variable for use in the undo function
                            save = deepcopy(board)

                            # Setting the value of board[i][j] to x
                            board[i][j] = x

                            # Printing the board with the newly updated value
                            print_board(board)
                    
                # else invalid input
                else:

                    # Print a statement informing the user
                    print("The position has already been filled with a value")

                # Indented the above two lines into an else statement
                ## My Code Ends Here

            # This function will execute when the user types new or n, valid only for values k of 2,3,4, d depends on value of k
            elif len(inp)==3 and (inp[0] == 'n' or inp[0] == 'new') and inp[1].isdecimal() and inp[2].isdecimal():
                k = int(inp[1])
                d = int(inp[2])
                if k < len(sudokus) and 0 < d <= len(sudokus[k]):
                    board = sudokus[k][d-1]
                    print_board(board)
                else:
                    print('board not found')

            # The function will quit when the user types in the letter q
            elif inp[0] == 'q' or inp[0] == 'quit':
                return

            ## My Code Starts Here (Undo Function)
            # Extending the play functionality (restart function)
            elif inp[0] == 'r' or inp[0] == 'restart':

                # The board printed will be the last loaded board
                board = save

                # Print the board out
                print_board(board)

            elif inp[0] == 'u' or inp[0] == 'undo':

                # Undoing the previous action of the user
                board[i][j] = 0

                # Print the board out
                print_board(board)

            ## My Code Ends Here (Undo Function)
            elif inp[0] == 'h' or inp[0] == 'hint' or inp[0] == 'hints':
            ## My Code Starts Here (Hints Function)

            # Calling the function
                i, j, hint_board = hints(board)

                # Printng the board with the hints
                print_board(hint_board)

                # Printing the tuple with the coordinates out
                print((i,j))

            ## My Code Ends Here
            else:
                print('Invalid input')

########### Functions only relevant for Part II ########
# My Written Code Starts Here

# The First Function
def backward_singles(board,i,j):
    """
    Name: backward_singles
    Purpose:
    Input: board (sudoku board) , i (row), j (col)
    Output: lst (a list with the possible options using the backward singles rule)
    """

    # My Thought Process for this rule
    # So, we will need to use the options function here, first of all, we will need to use the options function
    # at the specified row and col given. From here, we will have a list with length of more than 1 (guarenteed)
    # , since the forward singles rule would have terminated the function long ago. With the lst, we would need 
    # to loop through the lists and then we use that value to check for each of the options available for the row
    # column and the subgrid. If our options is present in any of the lists of those options, then we can just break
    # from the loop created.
    # A checker is utilised in order to determine whether we can straight away break out of the loop by returning
    # our value if it meet the condition or continue on with checking the row and the subgrid

    # If any of the values of the options for the particular position of i and j are not present in the 
    # any of the options of the entire row , entire column and the all of subgrid postion within the 
    # position of i and j vicinity, straight away return the value. If not, return None (if it did not meet any
    # of the criteria above).

    # Initialising the value
    # Assumming that we can't find a solution
    output = None

    # Using a checker to check whether we can output the value or not
    checker = 0

    # Calling the options function
    lst = options(board,i,j)

    # Loop through each of the values in the lists
    for value in lst:

        # Using a for loop to loop through all of the possible index
        for index in range(len(board)):

            # Using an if statement to check whether that the number is present of not
            if value in options(board, index, j):

                # Reset the checker value to zero
                checker = 0

                # Break away from this loop once the rule has been violated
                break

            # Incrementing the checker
            checker += 1

        # Return the value as our answer if and only if that our checker has a number of len(board)
        if checker == len(board):

            # Returning back the value
            return value

    # Repeat the same process as above , just iterate through the column and check the subgrid value
    for value in lst:

        for index in range(len(board)):
            
            # If statement to check the column
            if value in options(board, i, index):

                # Reset the checker value to zero
                checker = 0

                # Break away from the loop as well once the rule has been violated
                break

            # Incrementing the checker 
            checker += 1
            
        # Return the value as our answer if and only if that our checker has a number of len(board)
        if checker == len(board):

            # Returning back the value
            return value

    # # Checking for the subgrid values
    # Initialisng the variable
    sqrt_length = int(sqrt(len(board)))

    # Use a for loop and an if statement to loop through the index of the table
    for row in range(sqrt_length):
        
        # Using an if statement to compare the row value first, must modulo the comparison also since that value will keep on accumulating
        if i % sqrt_length == row:

            # Must decrement by that number so that u could go to the starting row of that subgrid
            store_val = row
            i -= store_val

            # Break out from the loop once the condition has been acheived
            break

    # Repeat the above process for the col
    # Use a for loop and an if statement to loop through the index of the table
    for col in range(sqrt_length):
        
        # Using an if statement to compare the col value
        if j % sqrt_length == col:

            # Must decrement by that number so that u could go to the starting row of that subgrid
            store_val2 = col
            j -= store_val2

            # Break out from the loop once the condition has been acheived
            break

    # Now , we can use the correct starting point for that subgrid and loop through the subgrid more easily and obtain the required values
    # Using two for loop to loop through the table
    # Loop from the starting point of the subgrid to the end of the row of that subgrid which is just sqrt_length

    # Looping through each of the values
    for value in lst:
            
        # Loop through the row in the subgrid
        for l in range(i, (i + sqrt_length)):

            # Looping through the colum in the subgrid
            for k in range(j, (j + sqrt_length)):

                # Using an if statement here and getting all of the options available in that position
                if value not in options(board, l, k):

                    # Increment the checker value
                    checker += 1

        # If the checker value is equal to the length of the subgrid valeus, meaning that it loop through the 
        # subgrid without breaking, then return that value instead
        if checker == len(board):

            # Returning back the value
            return value

    # Else, Just return None
    return output

def value_by_single(board, i, j):
    """
    Input : board, row, and column index
    Output: The correct value for field (i, j) in board if it can be inferred as
            either a forward or a backward single; or None otherwise. 
    
    For example:

    >>> value_by_single(small2, 0, 1)
    2
    >>> value_by_single(small2, 0, 0)
    3
    >>> value_by_single(big, 0, 0)
    """
    pass
    
    # Forward Single Rule Implementation
    # Calling the options function here
    forward_output = options(board,i,j)

    # If the output lists only has one value in it, then return that value, if not continue on with the backward
    # single implementation
    if len(forward_output) == 1:

        # Returning back the value
        output =  forward_output[0]
    
    # Backward Single Rule Implementation
    # If not , let us implement the backward singles method
    else:

        # Assigning the value in the list to output
        output = backward_singles(board,i,j)

    # Returning back the output
    return output


def inferred(board):
    """
    Input : Sudoku board
    Output: new Soduko board with all values field from input board plus
            all values that can be inferred by repeated application of 
            forward and backward single rule

    For example board big can be completely inferred:

    >>> inferred(big) # doctest: +NORMALIZE_WHITESPACE
    [[2, 1, 3, 4, 5, 6, 7, 8, 9],
    [4, 5, 6, 7, 8, 9, 1, 2, 3],
    [7, 8, 9, 1, 2, 3, 4, 5, 6],
    [1, 2, 4, 3, 6, 5, 8, 9, 7],
    [3, 6, 5, 8, 9, 7, 2, 1, 4],
    [8, 9, 7, 2, 1, 4, 3, 6, 5],
    [5, 3, 1, 6, 4, 2, 9, 7, 8],
    [6, 4, 2, 9, 7, 8, 5, 3, 1],
    [9, 7, 8, 5, 3, 1, 6, 4, 2]]

    But function doesn't modify input board:

    >>> big # doctest: +NORMALIZE_WHITESPACE
    [[0, 0, 0, 0, 0, 0, 0, 0, 0],
     [4, 0, 0, 7, 8, 9, 0, 0, 0],
     [7, 8, 0, 0, 0, 0, 0, 5, 6],
     [0, 2, 0, 3, 6, 0, 8, 0, 0],
     [0, 0, 5, 0, 0, 7, 0, 1, 0],
     [8, 0, 0, 2, 0, 0, 0, 0, 5], 
     [0, 0, 1, 6, 4, 0, 9, 7, 0],
     [0, 0, 0, 9, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 3, 0, 0, 0, 2]]

    In board big4 there is nothing to infer:
    
    >>> inferred(big4) # doctest: +NORMALIZE_WHITESPACE
    [[0, 0, 0, 6, 0, 0, 2, 0, 0],
     [8, 0, 4, 0, 3, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 9, 0, 0, 0], 
     [4, 0, 5, 0, 0, 0, 0, 0, 7],
     [7, 1, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 3, 0, 5, 0, 0, 0, 8],
     [3, 0, 0, 0, 7, 0, 0, 0, 4],
     [0, 0, 0, 0, 0, 1, 9, 0, 0],
     [0, 0, 0, 2, 0, 0, 0, 6, 0]]
    """
    pass


########### Driver code (executed when running module) #

import doctest
doctest.testmod()

play(big)