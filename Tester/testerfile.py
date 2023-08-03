# Decomposition
# The first function
from math import sqrt
from copy import deepcopy
from random import shuffle

# Sudoku Types
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

symbols = [' ', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G']

def print_board(board, hint=None):
    """
    Name: print_board
    Purpose: Prints a given board to the console in a way that aligns the content of columns and makes
             the subgrids visible.
    Input : a Sudoku board (board) of size 4x4, 9x9, or 16x16,
            optionally the coordinates of a field where to display the hint symbol ('*')
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
    n = len(board)
    k = round(sqrt(n))
    for i in range(n):
        if i % k == 0:
            print('-'*(len(board)+k+1))
        for j in range(n):
            if j % k == 0:
                print('|', end='')
            if hint and hint[0]==i and hint[1]==j:
                print('*', end='')
            else:
                print(symbols[board[i][j]], end='')
        print('|')
    print('-'*(len(board)+k+1))

# The second function
def subgrid_values(board, r, c):
    """
    Name: subgrid_values
    Purpose: Getting all of the values that are present in the subgrid requested by the user
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
    n = len(board)
    k = round(sqrt(n))
    res = []
    for i in range((r // k) * k, ((r // k) + 1) * k):
        for j in range((c // k) * k, ((c // k) + 1) * k):
            if board[i][j]:
                res.append(board[i][j])
    return res 

# The third function
def options(board, r, c):
    """
    Name: options
    Purpose: Getting all of the possible values that a user is allowed to place into a specified field
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
    if board[r][c]:
        return []

    res = []
    n = len(board)
    k = round(sqrt(n))    
    col_vals = [board[s][c] for s in range(n)]
    row_vals = board[r]
    subgrid_vals = subgrid_values(board, r, c)
    for x in range(1, n+1):
        if x not in col_vals and x not in row_vals and x not in subgrid_vals:
            res.append(x)
    return res

# The first function for assignment 2
def check_row(board,i,j,value):
    """
    Name: check_row
    Purpose: Checking through each of the options available in each row that has value of zero in 
             the sudoku board to see if the value at that specified position is in the options 
             for each row
    Input: board (sudoku board), i (specified row value) , j (specified column value) , value (value to be checked)
    Output: bool_value (True or False)
    """
    # What I need for this function is the board itself, the column for me to work with and the value 
    # that cannot be present in any of the options of the rows

    # Initialising a variable
    opt = []

    # Get a list and put all of the values into this list for all of the options that are available in which the 
    # value of that particular position of the board is zero
    # First, we need to loop through the rows in the board
    for row in range(len(board)):

        # Checking if the value at that particular position of the board is zero, if it is, get the available 
        # options and cannot loop at the particular position of the row since it would return back
        # our option that matches the options at the specified position
        if board[row][j] == 0 and i != row:

            # Get the available options here by using the options function
            opt = options(board,row,j)

            # Using an if statement now to check whether the value is in the list
            if value in opt:
                
                # Just break out of the statement and return False
                return False

    # If it manages check through the whole row and still that value is not present in any of the available
    # options, return True for that value
    return True

# The second function
def check_col(board,i,j,value):
    """
    Name: check_col
    Purpose: Checking through each of the options available in each column that has value of zero in 
             the sudoku board to see if the value at that specified position is in the options 
             for each column
    Input: board (sudoku board), i (specified row value) , j (specified column value) , value (value to be checked)
    Output: bool_value (True or False)
    """
    # What I need for this function is the board itself, the column for me to work with and the value 
    # that cannot be present in any of the options of the rows

    # Initialising a variable
    opt = []

    # Get a list and put all of the values into this list for all of the options that are available in which the 
    # value of that particular position of the board is zero
    # First, we need to loop through the rows in the board
    for col in range(len(board)):

        # Checking if the value at that particular position of the board is zero, if it is, get the available 
        # options
        if board[i][col] == 0 and col != j:

            # Get the available options here by using the options function
            opt = options(board,i,col)

            # Using an if statement now to check whether the value is in the list
            if value in opt:
                
                # Just break out of the statement and return False
                return False

    # If it manages check through the whole row and still that value is not present in any of the available
    # options, return True for that value
    return True

# The third function
def check_subgrid(board,i,j,value):
    """
    Name: check_subgrid
    Purpose: Checking through each of the options available in the subgrid that has value of zero in 
             the sudoku board to see if the value at that specified position is in the options 
             for the subgrid
    Input: board (sudoku board), i (specified row value) , j (specified column value) , value (value to be checked)
    Output: bool_value (True or False)
    """
    # Here it's a little diffrent, we need to loop through each value in the subgrid only
    # So , we would need to update the value of the row and the column

    # What I need for this function is the board itself, the column for me to work with and the value 
    # that cannot be present in any of the options of the rows
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

    # Get a list and put all of the values into this list for all of the options that are available in which the 
    # value of that particular position of the board is zero
    # First,we would need to loop through that specific row and that specific column
    # Loop through the row in the subgrid
    # We need to be careful here, we can't loop at that position of the origin itself since using the options 
    # function at that position will give us back the options that we have, so need to be careful on that,
    # We can rectify this in the is statement
    for l in range(i, (i + sqrt_length)):

        # Looping through the colum in the subgrid
        for k in range(j, (j + sqrt_length)):

            # Checking if that particular position in the sudoku is zero or not and make sure not 
            # to check at our specified row and column
            if board[l][k] == 0 and l != i and k != j:

                # Then now we can check whether that value is present in the options, if it is , straight away
                # return False
                if value in options(board,l,k):

                    return False

    # Else, we can just return True
    return True

# The fourth function
def value_by_single(board, i, j):
    """
    Name: value_by_single
    Purpose: Getting the correct value for field from the forward or backward single method
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

    """
    My Thought Process

    Forward Single Rule
    If there is only one value available provided by the option, then we can just use that value since that value
    would be the answer. It's just like this for the forward single rule. So just use the options function

    Backward Single Rule
    So, we will need to use the options function here, first of all, we will need to use the options function
    at the specified row, col and subgrid given. From here, we will have a list with length of more than 1 (guarenteed)
    , since the forward singles rule would have terminated the function long ago. With the lst, we would need 
    to loop through the lists and then we use that value to check for each of the options available for the row
    column and the subgrid. If our options is present in any of the lists of those options, then we can just break
    from the loop created.

    If any of the values of the options for the particular position of i and j are not present in the 
    any of the options of the entire row , entire column or all of subgrid postion within the 
    position of i and j vicinity, straight away return the value. If not, return None (if it did not meet any
    of the criteria above).
    """

    # Initialising the value
    lst = options(board, i, j)

    # Forward Single Rule
    # If the length of the list is one, then just return that value
    if len(lst) == 1:

        # Returning back the first element in the list
        return lst[0]

    # Backward Single Rule Implementation
    # Here ,we check the row of the sudoku board
    if len(lst) > 1:

        # Here ownwards, we can use the 3 created functions above, so if any of the functions return the value
        # of True , then we can just straight away return that value, if not, return None

        # We loop through the available value in the list
        for index in range(len(lst)):

            # Checking to see if the value of checker_row or checker_col or checker_sub is True
            if check_row(board,i,j,lst[index]) == True | check_col(board,i,j,lst[index]) == True | check_subgrid(board,i,j,lst[index]) == True:
                
                # Returning back that value
                return lst[index]

        # If after the loop the value is still not returned, return None
        return None

# The fifth function
def check_board(board):
    """
    Name: check_board
    Purpose: Checking if the value_by_single returns None for all of the field
    Input: board (sudoku board)
    Output: bool_val (True or False)
    """

    # Looping through the board
    for i in range(len(board)):

        for j in range(len(board)):

            # Using an if statement to check if any of the values in the board still can be inferred or not
            # by checking whether that value is None or not in the board
            if value_by_single(board,i,j) != None:

                # Return back True so that the while loop can keep on going
                return True

    # Otherwise, we can return the bool value of False to stop the while loop
    return False

# The sixth function
def inferred(board):
    """
    Name: inferred
    Purpose: Accepts as input a Sudoku board and returns as output a new Sudoku board that contains
             all values that can be inferred by the repeated applications of the two singles rule
             (meaning by just using the function value_by_single)
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

    """
    My Thought Process
    First, we need to create a copy of the board so that we can work with that board. Then , we need to use
    a while loop to keep on iterating through our copy of the board and check through each position of the
    board. If after going through all of the position of the board and we found that the position of the board
    that returns a value of None (using value_by_single), then we can conclude that the board is not solvable
    by using the inferred function , we can just return that copy of the board. Otherwise, we can use
    the value_by_single to continue to solve the board until we get the answer.
    """

    # Initialising the variable
    copy_board = deepcopy(board)
    checker = check_board(board)

    # Using a while loop (If checker is equal to True, this while loop will keep on running)
    while checker:

        # Looping through the copied board (row)
        for i in range(len(copy_board)):

            # Looping through the copied board (column)
            for j in range(len(copy_board)):

                # Only call the value_by_single function when the position of that board is zero
                # If not then can skip
                if copy_board[i][j] == 0:

                    # If the value_by_single returns a None, that value will be zero
                    if value_by_single(copy_board, i, j) == None:

                        # Setting the value to zero
                        copy_board[i][j] = 0

                    # Else, we can just put that value into that position
                    else:
                        copy_board[i][j] = value_by_single(copy_board, i, j)

        # Updating the value of checker
        checker = check_board(copy_board)

    # After the while loop, return the board
    return copy_board

# The seventh function
def smart_options(board):
    """
    Finding the position in the board that has only one options and fill that position up with that option only
    """

    # Looping through the board
    for i in range(len(board)):

        # Looping through the column
        for j in range(len(board)):

            # Finding the options of each of the position, if the len of the list provided
            # by the options function is one, then just assign that value to the particular position in the 
            # board
            # Only need to do this operation when that particular position has a value of zero
            if board[i][j] == 0:

                # If the length of the list of the options is equal to one, then just assign the value to 
                # the board
                if len(options(board,i,j)) == 1:
                    
                    # Assigning that value to the board
                    board[i][j] = options(board,i,j)[0]

    # Returning back the board after going through each position in the board
    return board

# Backtracking Function
# The eighth function
def solve(board):   
    """
    Name: solve
    Purpose: Solve a sudoku board
    Input: board (sudoku board)
    Output: solved board (solved sudoku board using the backtracking method)
    """

    """
    Thought Process
    1. Pick Empty Square
    2. Try all numbers
    3. As soon as we find a number, find one that works (using the options function )
    4. Repeat the above step
    5. When we get to a point where we can't continue to solve the sudoku, we need to backtrack
       and go back to the previous step

    Note: Step 2 to 3 , we can just use the options function
    So, since backtracking is recursive, we need to find the base case for our algorithm. The base case
    of our algorithm would be when the algorithm reaches the end of the sudoku which is when the 
    index for of the row and column is equal to len(board)-1. For safety, we can actually check whether the 
    current board has all of it's value filled out. So ,we can just call another function to check
    if there are no zeros in the current board

    Part 2
    Just use the options function to implement this. The options function will output a list of all of the numbers
    that is valid that can be used at a particular position in the board. So , we can use the options function and
    find the least amount of options available (the length of options which is the shortest) and use that to help
    speed up the process of solving our board. This will help reduce the time complexity as it does not have to
    keep on backtracking just to find the right answer for the sudoku board.

    Part 3
    Since the inferred function is first called when the board is inputted into the function, this would reduce
    the time complexity as the code does not need to keep on backtracking just to find the solution and could
    just use the inferred function to find the rest of the solution. So the inferred function will help to solve
    the sudoku board partially.So , it can be said that the inferred function is very useful to help solve
    the sudoku board.
    """

    # Looping through the row of the board                      
    for row in range(len(board)):

        # Looping through the column of the board
        for col in range(len(board)):

            # If at a particular position a board has a value of zero, then we can interact with the value at that point
            # If not , there is not really a point
            if board[row][col] == 0:

                # Looping through all of the possible values in the list
                # Integrating the options function here
                for val in options(board,row,col):

                    # Assigning the value to the particular position in the board
                    board[row][col] = val

                    # Recursively calling back the solve function again to check whether if the board is solved or not
                    # Integrating the inferred function here and the smart selection of options here
                    check = solve(smart_options(inferred(board)))

                    # Checking if the recursion is successful or not
                    if check is not None: 

                        # Returning back if the recursion is successful
                        return check
                    
                    # If not, backtrack and set the value to zero
                    board[row][col] = 0

                # Returning back None
                return None  

    # Returning the board 
    return board

# The 9th function
def generate_empty_grid(n):
    """
    Name: generate_empty_grid()
    Purpose: Generating empty grids of nxn sudoku
    Input: n (size of the sudoku board)
    Output: empty_grid (empty grid of size nxn)
    """

    # Using list comprehension here
    empty_grid = [[0 for i in range(n)] for j in range(n)]

    # Returning back the empty grid
    return empty_grid

# The 10th function
def check_valid_row(board,row,col):
    """
    Name: check_valid_row
    Purpose: Checking whether or not the value at the specified position has appeared throughout the row
    Input: board, i , j
    Output: bool_val (True or False)
    """

    # Looping through the row 
    for i in range(len(board)):

        # Using an if statement and make sure not to loop through it's position
        if board[row][col] == board[i][col] and row != i:

            # If there are the same, return False
            return False

    # Return True
    return True

# The 11th function
def check_valid_col(board,row,col):
    """
    Name: check_valid_col
    Purpose: Checking whether or not the value at the specified position has appeared throughout the column
    Input: board, i , j
    Output: bool_val (True or False)
    """

    # Looping through the row 
    for i in range(len(board)):

        # Using an if statement
        # Make sure to not loop through it's position as it will return the value of False
        if board[row][col] == board[row][i] and col != i:

            # If there are the same, return False
            return False

    # Return True
    return True

# The 12th function
def check_valid_subgrid(board,i,j):
    """
    Name: check_valid
    Purpose: Checking whether or not the value at the specified position has appeared at the subgrid
    Input: board, i , j
    Output: bool_val (True or False)
    """

    # Here it's a little diffrent, we need to loop through each value in the subgrid only
    # So , we would need to update the value of the row and the column
    # Keeping the value of the index using deepcopy to be used later
    index_row = deepcopy(i)
    index_col = deepcopy(j)

    # What I need for this function is the board itself, the column for me to work with and the value 
    # that cannot be present in any of the options of the rows
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

    # Looping through the specific subgrid values and checking whether if there is any of the same values
    for l in range(i, (i + sqrt_length)):

        # Looping through the colum in the subgrid
        for k in range(j, (j + sqrt_length)):

            # Checking if that particular position in the sudoku is zero or not and make sure not 
            # to check at our specified row and column
            if board[l][k] == board[index_row][index_col] and index_row != l and index_col != k :

                # Return False
                return False

    # Else, we can just return True
    return True

# The 13th function
def check_valid(board):
    """
    Name: check_valid
    Purpose: Checking whether or not the value at the specified position has appeared throughout the row, column or the
             subgrid
    Input: board, i , j
    Output: bool_val (True or False)
    """

    # Here , we need to loop through every position in the board and check for each position
    # Looping through the row
    for i in range(len(board)):

        # Looping through the column
        for j in range(len(board)):

            # Checking the three parts of the sudoku to determine that whether the sudoku is a valid one or not
            # Using an if statement to check the row , column and the subgrid
            if check_valid_col(board,i,j) == False | check_valid_row(board,i,j) == False | check_valid_subgrid(board,i,j) == False:

                # Returning back the value of False if any one of the checker function returns False
                return False

    # Otherwise return back True
    return True

# The 9th function
def check_unique(board):
    """
    Name: check_unique
    Purpose: Checking through each position in the sudoku board to check the options for each position (non-zero values)
    Input: board
    Output: board (modified board)
    """

    """
    My Thought Process
    This function is to iterate through each position in the board and check the position where it has a non-zero value
    and check whether the length of the option is equal to one at those position. If it is , then the sudoku is 
    probably a unique solution 
    """

    # Iterating through the other positions on the board to make sure that the other position only has one options
    # if not, 

    for i in range(len(board)):

        for j in range(len(board)):

            # Using the if statement to check through each position that has a value of != 0
            if board[i][j] != 0:

                # Checking through the options available
                if len(options(board,i,j)) == 1:

                    board[i][j] = 0

    # Returning back the board
    return board

# The 10th function
def generate(k):
    """
    Name: generate
    Purpose: generate random sudoku boards
    Input: board
    Output: board
    """

    """
    My Thought Process
    We can use the backtracking function that we have created above. 

    Steps

    Part 1

    1. Shuffle a list of numbers that is to put into the board using the shuffle function
    2. Generate a valid sudoku board using the backtracking algorithm that we have created above.

    Part 2
    3. After that, we can start to remove the numbers at a randomized position that we could obtain
       using the shuffle function.
    4. We can then test the uniqueness of the current solution that we have using the backtracking algorithm
       and also the options function that we have created.
    5. If the sudoku board still only has one valid solution/options at that position, repeat step 3 (part 2)

    Part 3
    6. If the current board now has more than one options, we can undo our step and check back the previous board (deepcopy)
    7. We check that board for all of the non-zero values if any of those values has an option of more than one.
       If there is , replace that position with a value of zero
    8. A board with a unique solution can then be produced
    """

    # Updating the value of n
    n = k**2

    # Initialising the variable
    lst = list(range(1,n+1))
    index_lst = list(range(n))
    shuffle(lst)
    checker = True

    # Generating an empty grid of nxn
    sudoku = generate_empty_grid(n)

    # # Using a while loop to keep on doing this operation
    # while True:

    # Filling up the first row of the sudoku board with random numbers
    for i in range(n):

        sudoku[0][i] = lst[i]

    # Using backtracking to fill up the remaining board
    sudoku = solve(sudoku)

    # Once we got our full sudoku board that is solvable above, we can start to remove the 
    # values from the sudoku and check if there is only one unique solution
    # Using a while loop here
    while checker:

        # Now here we need to remove a number at a random position, we can do this by shuffling the list
        # and take a random number out of the list
        shuffle(index_lst)

        # Row and Column
        row = index_lst[0]
        col = index_lst[1]

        # Saving the board in another copy using deepcopy
        copy_board = deepcopy(sudoku)

        # Remove the value at the specified position
        sudoku[row][col] = 0

        # Checking the solutions of the sudoku
        # If the options has a list of length 1, continue the cycle, if not exit from the loop since
        # it will have more than one solution
        checker = (len(options(sudoku,row,col)) == 1)

        # If the checker has a bool of False, we still have to do one more thing. That is to loop through the 
        # whole board to check which position that when we set to zero will have a value of options of more than 1
        if not checker:

            # Checking the uniqueness of the board just in case 
            sudoku = check_unique(copy_board)

    # Returning back the sudoku
    return sudoku

# Testing the generate function
# print_board(generate(2))
# print_board(generate(3))
# print_board(generate(4))
# print_board(generate(2))
# print_board(generate(2))
# print_board(generate(2))
# print_board(generate(3))
# print_board(generate(4))
# print_board(solve(generate_empty_grid(9)))
# print(solve(generate_empty_grid(10)))
# print_board(solve(small))
# print_board(solve(small2))
# print_board(solve(big))
# print_board(solve(big2))
# print_board(solve(big3))
# print_board(solve(big4))
# print_board(solve(giant))
# print_board(solve(giant2))
# print_board(solve(giant3))