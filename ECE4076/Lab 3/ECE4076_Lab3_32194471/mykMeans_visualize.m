function [centroids, cluster_idx] = mykMeans_visualize(data, centroids, T)
    % Inputs  - data        : Nx3 matrix (N x d)
    %         - centroids   : kx3 matrix (k x d)
    %         - T           : integer
    % N = number of data points, d = dimension of data, k = number of centroids, T = number of iterations

    % Initialize variables
    N = size(data, 1);
    k = size(centroids, 1);
    cluster_idx = zeros(N, 1);

    % Perform k-means clustering
    for t = 1:T
        % Assign each data point to the closest centroid
        for i = 1:N
            [~, cluster_idx(i)] = min(sum((centroids - data(i, :)).^2, 2));
        end

        % Update centroids
        for j = 1:k
            centroids(j, :) = mean(data(cluster_idx == j, :), 1);
        end

        % Visualize the results at every iteration
        sample_idx = randperm(N, 250);
        visualize(data, cluster_idx, centroids, sample_idx);

        % Add a pause of 1-2 seconds after each iteration
        pause(2);
    end
end
