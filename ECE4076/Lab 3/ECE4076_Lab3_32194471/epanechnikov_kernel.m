% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: epanechnikov_kernel.m (Used in Lab3_Task5)

function K = epanechnikov_kernel(centers, X, bandwidth)
    % Inputs - centers : the means (m x 1 array), where m is the number of centres
    %        - X : samples (i x 1 array), where i is the number of samples
    %        - bandwidth : a scalar value representing "h" in the equation
    % Output - K : the kernel output for each distance from the means

    % Calculate the squared distances between the centers and the points
    distances_squared = (centers - X').^2;

    % Scale the distances
    scaled_distances = distances_squared / bandwidth^2;

    % Calculate the kernel values
    K = zeros(size(scaled_distances));
    K(scaled_distances <= 1) = 3/4*(1 - scaled_distances(scaled_distances <= 1));
end
