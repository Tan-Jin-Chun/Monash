function D = dist2c(data, centroids)
% X: data points, each row represents a data point
% M: centroids, each row represents a centroid
% D: squared distance from each data point to each centroid

n = size(data, 1); % number of data points
k = size(centroids, 1); % number of centroids

% compute squared distance between each data point and each centroid
D = zeros(n, k);
for i = 1:k
    d = data - repmat(centroids(i,:), n, 1);
    D(:,i) = sum(d.^2, 2);
end
