% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task3

function centroids = random_centroids(data, k)
    % Input: 
    %   data: N by d matrix, where N is the number of data points, and d is the dimension of the data.
    %   k: integer, the number of centroids.
    % Output:
    %   centroids: k by d matrix, each row is a centroid.

    % Get the number of data points
    N = size(data, 1);

    % Generate k unique random indices from 1 to N
    indices = randperm(N, k);

    % Select the corresponding rows from the data matrix
    centroids = data(indices, :);
end
