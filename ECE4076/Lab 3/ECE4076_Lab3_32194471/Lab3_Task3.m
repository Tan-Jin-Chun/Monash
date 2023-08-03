% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task3

clearvars -except img k;
close all; clc;
img = imread('sharon.jpg');
k = 4;
max_iter = 200;

% Set to 1 to see pausing key effect
verbose = 0;
[segmented_img, M, total_iteration] = imagesegkmeansplus(img, k, max_iter, verbose);

figure(1);
montage({img, segmented_img});
ti = sprintf('Before K-means++ (left) and after K-means++ (right) with k = %d', k);
title(ti);

figure(2);
imshow(segmented_img);
ti = sprintf('K-means++ clustering Image with k = %d', k);
title(ti);