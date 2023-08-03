% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task6
% Purpose of the file: Find the center of the helipad and return the row
% and column of the centre of the helipad

%% My Code Logic
% Load the image provided.
% Apply Gaussian blur to the image.
% Calculate the gradient magnitude and orientation of the blurred image using Sobel filters.
% Apply non-maxima suppression to thin out the edges in the image.
% Apply hysteresis thresholding to identify edges with low and high threshold values.
% Find contours in the image and filter out those that are not likely to be the letter H.
% Calculate the centroid of the remaining contour to find the center of the letter H.
% Plot an x at the center of the letter H.

clear all;close all;clc;

% Read the image
Im = imread('task6_helipad.png');

% Define the Gaussian filter and Sobel filter kernels
matrix = [2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2];
const = 1/159;
kernel = const .* matrix;
x_sobel = [-1 0 1; -2 0 2; -1 0 1];
y_sobel = [-1 -2 -1; 0 0 0; 1 2 1];

% Blur the image using the Gaussian filter
B = myconv(Im,kernel);

% Compute the gradient of the blurred image in the x and y direction using the Sobel filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Compute the gradient magnitude and orientation
G = sqrt(Gx.^2 + Gy.^2);
theta = atan2d(-Gy, Gx);

% Round the gradient orientation to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Perform non-maximum suppression to thin out the edges
% low_threshold = 0.25;
% high_threshold = 0.50;
% The low_threshold parameter sets the minimum threshold value for an edge
% to be considered part of the output. Edges with gradient magnitudes 
% below this threshold are discarded.

% The high_threshold parameter sets the maximum threshold value for 
% an edge to be considered part of the output, and is used to link edges
% together into continuous curves. If an edge has a gradient magnitude 
% above the high threshold, it is considered a strong edge. 
% If an edge has a gradient magnitude between the low and high thresholds, 
% it is considered a weak edge.
low_threshold = 0.25;
high_threshold = 1.2;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% % Displaying the binary Image to check the edge detection
% figure(1);
% imshow(binary_Image);

% % Using the matlab built-in function to detect the binary image
% binary_Image2 = edge(Im,'canny');
% figure(2);
% imshow(binary_Image2);

% -------------------------------------------------------------
% Apply a connected component analysis to detect the letter H
cc = bwconncomp(binary_Image);
stats = regionprops(cc, 'BoundingBox', 'Area');
areas = [stats.Area];
idx = find(areas == max(areas));

% Get the boundary of the largest connected component
b = bwboundaries(cc.PixelIdxList{idx});

% % Draw an X at the center of the boundary of the letter H
% x_center = round(mean(b{1}(:,2)));
% y_center = round(mean(b{1}(:,1)));
% marked_img = insertMarker(Im, [x_center y_center], 'x', 'size', 1, 'Color', 'red');

% Draw an X at the center of the bounding box of the letter H
% bbox(1) is the x coordinate of the top-left corner of the bounding box, 
% bbox(2) is the y coordinate of the top-left corner of the bounding box, 
% bbox(3) is the width of the bounding box, and 
% bbox(4) is the height of the bounding box.
bbox = stats(idx).BoundingBox;
x_center = round(bbox(1)/1.3 + bbox(3)/2)-1;
y_center = round(bbox(2)/1.13 + bbox(4)/2);

% % Inserting the marker on the image
marked_img = insertMarker(Im, [x_center y_center], 'x', 'size', 1,'Color','red');

% Display the marked image
figure(1);
hold on
xlabel("x-coordinate");
ylabel("y-coordinate");
title("Center of the Helipad");
imshow(marked_img,[], 'InitialMagnification', 'fit');
axis on;

% Setting the limit of my axis
xlim([0, 100]);
ylim([0, 100]);

% Display the coordinates of the selected point below the marker
% text(x_center, y_center, ['(' num2str(x_center) ',' num2str(y_center) ')'], 'Color', 'r');
% text(x_center, y_center+5, ['(' num2str(x_center) ',' num2str(y_center) ')'], 'Color', 'r', 'HorizontalAlignment', 'center');
hold off


% %% Comparing from the image given whether the letter x is located
% % % Inserting the marker on the image
% marked_img2 = insertMarker(Im, [66 51], 'x', 'size', 1,'Color','red');
% 
% % Display the marked image
% figure(3);
% % title("Center of the Helipad");
% imshow(marked_img2, 'InitialMagnification', 'fit');

%% Demonstrate your understanding by answering the question below:
% How did you adapt your previous code to solve this problem? 

% What I did was that I just used the code from the previous task, which
% includes calculating the gradient magnitude and the gradient orientation,
% find the suitable threshold to be used on my image and find the
% boundaries of the H symbol in my image. Later i just plot an x on the
% supposed coordinates obtained via my algorithm. 