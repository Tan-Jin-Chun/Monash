% Written by Nigel Tan Jin Chun
% Last Modified: 26/4/2023
% Name of the file: Lab3_Task1
% Function: 
% Building a helper function that will compute the squared
% distance from a set of data points to a set of centroids

clear all;clc;close all;

% The given small dataset of 5 data points
X = [0.67187976, 0.44254368, 0.17900127;
     0.55085456, 0.65891464, 0.18370379;
     0.79861987, 0.3439561, 0.68334744;
     0.36695437, 0.15391793, 0.81100023;
     0.22898267, 0.58062367, 0.5637733];

% The given two centroids
M = [0.66441854, 0.08332493, 0.54049661;
     0.05491067, 0.94606233, 0.29515262];

% Calling the function
D = transpose(dist2c(X, M));

% Displaying the matrix
disp(D);

% Assign each point to closest centroid
% D = transpose(D)
% [~, labels] = min(D, [], 2);
[~, labels] = min(D, [], 1);

% Define colors for the points
colors = ['r', 'b'];

% Create 3D scatter plot
figure(1);
% scatter3(X(:, 1), X(:, 2), X(:, 3), 100, labels, 'filled');
for i = 1:size(X, 1)
    scatter3(X(i, 1), X(i, 2), X(i, 3), 100, colors(labels(i)), 'filled'); hold on;
end

% Define colors for centroids
centroid_colors = ['k', 'k'];

% Plot the centroids
hold on;
% scatter3(M(:, 1), M(:, 2), M(:, 3), 200, 'r', 'X', 'LineWidth',2);
for i = 1:size(M, 1)
    scatter3(M(i, 1), M(i, 2), M(i, 3), 200, centroid_colors(i), 'X', 'LineWidth',2); 
    hold on;
end
hold off;

% Labelling the graph
title('3D Scatter Plot')
xlabel('X')
ylabel('Y')
zlabel('Z')

