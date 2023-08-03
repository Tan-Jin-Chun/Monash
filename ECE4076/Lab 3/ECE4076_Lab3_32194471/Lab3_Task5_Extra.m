% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task5_Extra

clear all;clc;close all;

% Read the image
img = imread('sharon.jpg');

% Convert to RGB (MATLAB already reads images in RGB format)
img_rgb = img;

% Convert to LAB
img_lab = rgb2lab(img);

% Visualize the results
figure;
subplot(1, 2, 1);
imshow(img_rgb);
title('RGB Image');
subplot(1, 2, 2);
imshow(img_lab); % Convert LAB back to RGB for visualization purposes
title('LAB Image');

% Mean Shift Clustering
k = 5; % A guess for the number of clusters

% Reshape the image matrices
img_rgb_2d = double(reshape(img_rgb, [], 3));
img_lab_2d = double(reshape(img_lab, [], 3));

% Apply K-means clustering
[rgb_cluster_idx, rgb_centroids] = kmeans(img_rgb_2d, k);
[lab_cluster_idx, lab_centroids] = kmeans(img_lab_2d, k);

% Create clustered images
rgb_clustered = reshape(rgb_centroids(rgb_cluster_idx, :), size(img_rgb));
lab_clustered = reshape(lab_centroids(lab_cluster_idx, :), size(img_lab));

% Import the required function
import msseg.*;

% Mean-Shift parameters
hs = 12; % Spatial bandwidth
hr = 12; % Color bandwidth
M = 40; % Minimum region area

% Segment the image using Mean-Shift


% Show the segmented image
figure;
imshow(uint8(segmented));
title('Mean-Shift Segmented Image');

% Printing out the number of colours
fprintf('Mean-Shift found %d colors in the image.\n', N);

