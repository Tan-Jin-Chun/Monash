function centroids = kmeanspp_centroids(data, k)
    % Inputs  - data        : Nx3 matrix (N x d)
    %         - k           : an integer value
    % Output  - centroids   : kx3 matrix (k x d)
    % N = number of data points, d = dimension of data, k = number of centroids
    
    % Initialize variables
    N = size(data, 1);
    centroids = zeros(k, 3);
    
    % Choose the first centroid uniformly at random from the data points
    centroids(1, :) = data(randi(N), :);
    
    % Initialize the array to store the minimum squared distance to a centroid
    min_sq_dist = zeros(N, 1);
    
    % Choose the remaining centroids
    for i = 2:k
        % Update the minimum squared distance for each point
        for j = 1:N
            sq_dist = sum((centroids(1:i-1, :) - data(j, :)).^2, 2);
            min_sq_dist(j) = min(sq_dist);
        end
        
        % Compute the probability distribution
        prob_distribution = min_sq_dist / sum(min_sq_dist);
        
        % Choose the next centroid according to the probability distribution
        next_centroid_idx = randsample(1:N, 1, true, prob_distribution);
        centroids(i, :) = data(next_centroid_idx, :);
    end
end
