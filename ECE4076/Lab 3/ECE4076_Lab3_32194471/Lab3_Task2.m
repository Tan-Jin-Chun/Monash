% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task2

clearvars -except img k;
close all; clc;
img = imread('sharon.jpg');
k = 4;
max_iter = 200;

% Set to 1 to see pausing key effect
verbose = 0;
[segmented_img, M, total_iteration] = imagesegkmeans(img, k, max_iter, verbose);

figure(1);
montage({img, segmented_img});
ti = sprintf('Before K-means (left) and after K-means (right) with k = %d', k);
title(ti);

figure(2);
imshow(segmented_img);
ti = sprintf('K-means clustering Image with k = %d', k);
title(ti);

% Drawing the 3D Scatter Plot

% Convert the image to an array of RGB values
rgb_vals = im2double(img);

% Reshape the RGB values array into a 2D array
rgb_vals = reshape(rgb_vals, [], 3);

% Specify the number of clusters
k = 5;

% Perform k-means clustering on the RGB values
[idx, centroid_rgb] = image_seg_means(rgb_vals, k);

% Map each RGB color value to its assigned centroid RGB value
assigned_rgb_vals = centroid_rgb(idx, :);

% Create a 3D scatter plot with color mapped to the assigned centroid RGB value
fig = figure;
scatter3(rgb_vals(:,1), rgb_vals(:,2), rgb_vals(:,3), 10, assigned_rgb_vals, 'filled')
hold on
scatter3(centroid_rgb(:,1), centroid_rgb(:,2), centroid_rgb(:,3), 100, 'kx', 'LineWidth', 2)
hold off
xlabel('Red')
ylabel('Green')
zlabel('Blue')


