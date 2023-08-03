function visualize(data, cluster_idx, centroids, sample_idx)
    % Inputs  - data        : Nx3 matrix (N x d)
    %         - cluster_idx : Nx1 vector (N,)
    %         - centroids   : kx3 matrix (k x d)
    %         - sample_idx  : 1x250 vector (250,)
    % N = number of data points, d = dimension of data, k = number of centroids

    % Create 3D scatter plot with corresponding colors as the first sub-plot
    figure;
    ax1 = subplot(1, 2, 1);
    view(ax1, 3);
    hold(ax1, 'on');
    colors = hsv(size(centroids, 1));

    for i = 1:length(sample_idx)
        point = data(sample_idx(i), :);
        point_cluster_idx = cluster_idx(sample_idx(i));
        scatter3(ax1, point(1), point(2), point(3), 50, colors(point_cluster_idx, :), 'filled');
    end

    % Plot centroids with black 'x' markers
    scatter3(ax1, centroids(:, 1), centroids(:, 2), centroids(:, 3), 100, 'black', 'x', 'LineWidth', 1.5);
    grid(ax1, 'on');
    title(ax1, '3D Scatter Plot of Data Points and Centroids');

    % Create visualization of the clustered image as the second sub-plot
    ax2 = subplot(1, 2, 2);
    img_height = max(data(:, 2)) - min(data(:, 2)) + 1;
    img_width = max(data(:, 1)) - min(data(:, 1)) + 1;
    clustered_img = zeros(img_height, img_width, 3);

    for i = 1:size(data, 1)
        x = data(i, 1) - min(data(:, 1)) + 1;
        y = data(i, 2) - min(data(:, 2)) + 1;
        clustered_img(y, x, :) = colors(cluster_idx(i), :);
    end

    imshow(clustered_img, 'Parent', ax2);
    title(ax2, 'Clustered Image');
end
