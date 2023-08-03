% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: flat_kernel.m (Used in Lab3_Task5)

function K = flat_kernel(centers, X, bandwidth)
    % Purpose of the function:
    % Basically just implements the flat kernel, which is a type of window
    % function used in MS(Mean Shift) algo
    % Checks whether the distance between a center and a point in 'X' is 
    % within a bandwidth.
    % If it is, it will assign a kernel value of 1 to that point. If not,it
    % will assign a kernel value of 0 to that point. The kernel values are
    % returned by the function

    % Inputs:
    % centers - a column vector (k x 1) representing the centers, where k is the number of centers
    % X - a column vector (i x 1) representing the samples, where i is the number of samples
    % bandwidth - a scalar representing the bandwidth "h" in the kernel equation. This is optional and defaults to 0.1 if not provided.
    
    % Outputs:
    % K - a column vector (i x 1) representing the kernel values for each distance from the centers
    
    % nargin returns the number of function input arguments given in
    % the call to the currently executing function
    % Basically checking if the bandwidth was provided, if not, set a
    % default value
    if (nargin < 3)
        bandwidth = 0.1;
    end
    
    % Baically compute the squared distances between each center and each point in X.
    % This is done by subtracting each center from each point in X (element-wise),
    % and then squaring the result (element-wise).
    distances_squared = (centers - X').^2;
    
    % Calculate the kernel values
    % The kernel function is a type of window function that is equal to 1 inside the window
    % (defined by the bandwidth 'h') and zero outside.
    % We check whether each squared distance is less than or equal to the square of the bandwidth.
    % If it is, we set the corresponding kernel value to 1. Otherwise, we set it to 0.
    K = double(distances_squared <= bandwidth^2);

end
