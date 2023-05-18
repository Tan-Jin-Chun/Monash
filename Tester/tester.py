# Tester 1 File
from copy import deepcopy

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

# Solutions
"""
big:

-------------
|213|456|789|
|456|789|123|
|789|123|456|
-------------
|124|365|897|
|365|897|214|
|897|214|365|
-------------
|531|642|978|
|642|978|531|
|978|531|642|
-------------

big2:

-------------
|736|842|519|
|254|179|836|
|819|536|247|
-------------
|395|761|428|
|627|458|193|
|148|293|675|
-------------
|473|615|982|
|581|927|364|
|962|384|751|
-------------

giant:

---------------------
|3ED6|BG49|2781|5ACF|
|78C2|A3FD|G5EB|6914|
|BAG4|16C5|F39D|7E28|
|195F|E728|C46A|G3BD|
---------------------
|C623|54GB|8A17|DF9E|
|AD71|6F82|EC49|3G5B|
|8FB9|D17E|56G3|24AC|
|54EG|C93A|B2DF|1786|
---------------------
|FB15|G89C|DE24|A637|
|2GA8|3BE1|79C6|4DF5|
|9C4E|2D67|3FA5|8BG1|
|673D|45AF|18BG|9CE2|
---------------------
|D28B|9C13|4G7E|F56A|
|E56A|F2B4|9D38|C17G|
|4197|8A5G|6BFC|E2D3|
|G3FC|7ED6|A152|B849|
---------------------

giant2:

---------------------
|E5A2|F4C8|36DB|719G|
|1G39|562D|4AC7|FE8B|
|D846|173B|GFE9|5A2C|
|7BCF|AG9E|1258|346D|
---------------------
|F613|C972|A84D|B5GE|
|GA8C|4315|7B2E|6FD9|
|479E|DB86|C5FG|123A|
|2D5B|EAFG|6913|87C4|
---------------------
|32F4|BDE9|5C61|AG78|
|51E7|82GF|B39A|CD46|
|B9GA|614C|D782|E35F|
|6CD8|35A7|E4GF|29B1|
---------------------
|932D|7E64|81AC|GBF5|
|CE6G|2FBA|9D35|4817|
|8F75|GCD1|2EB4|96A3|
|A4B1|9853|FG76|DCE2|
---------------------
"""
from math import sqrt
symbols = [' ', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G']
def print_board(board, hint=None):
    """
    Prints a given board to the console in a way that aligns the content of columns and makes
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

# print(options(small2,0,0))
# print(options(small2,0,1))
# print(options(small2,1,0))
# print(options(small2,1,1))

# Decomposition
# Function 1
# Check through each of the options in row
def check_row(board,i,j,value):
    """
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

# Function 2
# Exactly the same thing as above , just that we now need to do for the column instead
def check_col(board,i,j,value):
    """
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

# Function 3
# Same thing as above but for subgrid values
def check_subgrid(board,i,j,value):
    """
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

            # Checking if that particular position in the sudoku is zero or not
            if board[l][k] == 0 and l != i and k != j:

                # Then now we can check whether that value is present in the options, if it is , straight away
                # return False
                if value in options(board,l,k):

                    return False

    # Else, we can just return True
    return True

def value_by_single(board, i, j):
    """
    Name: value_by_single
    Purpose: 
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

    # # My Thought Process for this rule
    # # So, we will need to use the options function here, first of all, we will need to use the options function
    # # at the specified row and col given. From here, we will have a list with length of more than 1 (guarenteed)
    # # , since the forward singles rule would have terminated the function long ago. With the lst, we would need 
    # # to loop through the lists and then we use that value to check for each of the options available for the row
    # # column and the subgrid. If our options is present in any of the lists of those options, then we can just break
    # # from the loop created.
    # # A checker is utilised in order to determine whether we can straight away break out of the loop by returning
    # # our value if it meet the condition or continue on with checking the row and the subgrid

    # # If any of the values of the options for the particular position of i and j are not present in the 
    # # any of the options of the entire row , entire column and the all of subgrid postion within the 
    # # position of i and j vicinity, straight away return the value. If not, return None (if it did not meet any
    # # of the criteria above).

    # Forward Single Rule
    # If there is only one value available provided by the option, then we can just use that value since that value
    # would be the answer. It's just like this for the forward single rule. So just use the options function

    # Initialising the value
    lst = options(board, i, j)

    # Forward Single Rule
    # If the length of the list is one, then just return that value
    if len(lst) == 1:

        return lst[0]

    # Backward Single Rule Implementation
    # Here ,we check the row of the sudoku board
    if len(lst) > 1:

        # Here ownwards, we can use the 3 created functions above, so if any of the functions return the value
        # of True , then we can just straight away return that value, if not, return None

        # We loop through the available value in the list
        for index in range(len(lst)):

            checker_row = check_row(board,i,j,lst[index])
            checker_col = check_col(board,i,j,lst[index])
            checker_sub = check_subgrid(board,i,j,lst[index])

            # Checking to see if the value of checker_row or checker_col or checker_sub is True
            if checker_row == True | checker_col == True | checker_sub == True:

                return lst[index]

        # If after the loop the value is still not returned, return None
        return None


# Function 4
# Checking whether if any of the values in the board has a value of None (value_by_single) or not
def check_board(board):
    """
    Checking if the value_by_single returns None for all of the field
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

# print(inferred(big))
# print(inferred(big4))

# Backtracking
# Solutions
"""
big:

-------------
|213|456|789|
|456|789|123|
|789|123|456|
-------------
|124|365|897|
|365|897|214|
|897|214|365|
-------------
|531|642|978|
|642|978|531|
|978|531|642|
-------------

big2:

-------------
|736|842|519|
|254|179|836|
|819|536|247|
-------------
|395|761|428|
|627|458|193|
|148|293|675|
-------------
|473|615|982|
|581|927|364|
|962|384|751|
-------------

giant:

---------------------
|3ED6|BG49|2781|5ACF|
|78C2|A3FD|G5EB|6914|
|BAG4|16C5|F39D|7E28|
|195F|E728|C46A|G3BD|
---------------------
|C623|54GB|8A17|DF9E|
|AD71|6F82|EC49|3G5B|
|8FB9|D17E|56G3|24AC|
|54EG|C93A|B2DF|1786|
---------------------
|FB15|G89C|DE24|A637|
|2GA8|3BE1|79C6|4DF5|
|9C4E|2D67|3FA5|8BG1|
|673D|45AF|18BG|9CE2|
---------------------
|D28B|9C13|4G7E|F56A|
|E56A|F2B4|9D38|C17G|
|4197|8A5G|6BFC|E2D3|
|G3FC|7ED6|A152|B849|
---------------------

giant2:

---------------------
|E5A2|F4C8|36DB|719G|
|1G39|562D|4AC7|FE8B|
|D846|173B|GFE9|5A2C|
|7BCF|AG9E|1258|346D|
---------------------
|F613|C972|A84D|B5GE|
|GA8C|4315|7B2E|6FD9|
|479E|DB86|C5FG|123A|
|2D5B|EAFG|6913|87C4|
---------------------
|32F4|BDE9|5C61|AG78|
|51E7|82GF|B39A|CD46|
|B9GA|614C|D782|E35F|
|6CD8|35A7|E4GF|29B1|
---------------------
|932D|7E64|81AC|GBF5|
|CE6G|2FBA|9D35|4817|
|8F75|GCD1|2EB4|96A3|
|A4B1|9853|FG76|DCE2|
---------------------
"""

def check_board_zero(board):
    """
    Checking whether all oif the values of the board are not zero
    Returns True if all of the values in the board are not zero, if any one of the values in the sudoku board
    has a value of zero, return False
    """
    # Looping through the board
    for i in range(len(board)):
        for j in range(len(board)):

            # Using an if statement
            if board[i][j] == 0:

                # Return the bool value of False
                return False

    # Else, we can just return True
    return True


# The fourth function
def solve(copy_board, i=0, j=0):
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

    Note: Step 1 to 3 , we can just use the options function
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

    # Initialising the variables
    # copy_board = deepcopy(board)

    # Straight away call the inferred function
    inferred(copy_board)

    # First Base Case
    # Checking if there is empty field in the board, if no, just return theboard, if yes, use backtracking
    if check_board_zero(copy_board):

        # Returning back the sudoku board
        return

    # Backtracking Implementation
    else:

        # Second Base Case
        # If it has reached the end of the row and the column
        if (i == len(copy_board)-1) and (j == len(copy_board)-1):

            # Checking to see if there are no zero's in the current sudoku board
            if copy_board[i][j] != 0:
                
                # Return the copy board
                return

            else:

                # Looping through the possible value
                for val in range(1, len(copy_board)+1):

                    # Using an if statement to check if the value is in our options (whether it is valid or not)
                    if val in options(copy_board, i, j):

                        # Set that value to our board
                        copy_board[i][j] = val

                        # # Recalling the function solve
                        # solve(copy_board,i,j+1)

                        # Backtracking
                        copy_board[i][j] == 0

            return

        # If it does not achieve the base case, continue to carry out the operation
        else:

            # If the value of the column is bigger than the len(copy_board)-1, that means we need to reset
            # the value of the column to zero and increment the value of the row by 1
            if j == (len(copy_board)-1):

                # Backtracking by recursively calling back the function
                solve(copy_board, i+1, 0)

                # Returning back the board
                return

            # Else, continue the backtracking 
            else:
                # Checking the value of the board at the specified postion
                # If the value is equal to zero, then we can act on the sudoku board, if not it is pointless and so
                # we can just increment the value of the column and move on to our next operation
                if copy_board[i][j] == 0:

                    # Looping through the possible value
                    for val in range(1, len(copy_board)+1):

                        # Using an if statement to check if the value is in our options (whether it is valid or not)
                        if val in options(copy_board,i,j):

                            # Set that value to our board
                            copy_board[i][j] = val

                            # Recusively call our function back and make sure to increment the value of the column
                            solve(copy_board, i, j + 1)

                            # Resetting the value of the board back to zero to allow for the possible valid solutions
                            # to be used (Backtracking)
                            copy_board[i][j] = 0

                # Else, move on to our next operation
                else:

                    # Recursively calling back the function and again increment the index of the column
                    solve(copy_board, i, j+1)

                return


# Printing out the board
# Solved (Using Inferrence)
solve(small)
print_board(small)
# print_board(solve(small2))
# print_board(solve(big))
# print_board(solve(giant))
# print_board(solve(big2))

# print(solve(big3))
# print(solve(big3))
# print(solve(big4))
# print(solve(giant2))
# print(solve(giant3))


# print_board(inferred(small))
# print_board(inferred(small2))
# print_board(inferred(big))
# print_board(inferred(big2))
# print_board(inferred(big3))
# print_board(inferred(big4))
# print_board(inferred(giant))
# print_board(inferred(giant2))
# print_board(inferred(giant3))
# print(solve(small))
# print(solve(small2))

# The fifth function
def generate(board):
    """
    Name: generate
    Purpose:
    Input:
    Output:
    """
