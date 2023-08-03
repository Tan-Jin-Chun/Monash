
% Lab3 Task 2 Alternative, Tan Jin Chun

clearvars -except img k;
close all; clc;

% Specify a random seed (will determine the random initialization)
rng(17);

% Load the image
image_file = 'sharon.jpg'; % Replace with your image path
img = imread(image_file);

% Convert the image to grayscale (if it's a color image)
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Extract the pixel coordinates (x, y) and intensity values (I)
[X, Y] = meshgrid(1:size(img, 2), 1:size(img, 1));
intensity = double(img(:));
x_coords = X(:);
y_coords = Y(:);

% Normalize the intensity values to a range between 0 and 1
intensity = intensity - min(intensity);
intensity = intensity / max(intensity);

% Ensure that x_coords, y_coords, and intensity have the same dimensions
x_coords = x_coords(:);
y_coords = y_coords(:);
intensity = intensity(:);

% Form the datapoints by combining the pixel coordinates and intensity values
data_points = [x_coords, y_coords, intensity];

% Number of centroids (clusters) and iterations
k = 2;
T = 10;

% Initialize centroids randomly
min_vals = min(data_points);
max_vals = max(data_points);
centroids = (max_vals - min_vals) .* rand(k, 3) + min_vals;

% Run the mykMeans_visualize function
[updated_centroids, cluster_idx] = mykMeans_visualize(data_points, centroids, T);
