% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task5
% Purpose of the file: Perform non-maxima suppresion and handling

clear all;close all;clc;

% Defining the Gaussian kernel
matrix = [2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2];
const = 1/159;
kernel = const .* matrix;

% Defining the Sobel Filter (Sobel Kernel Horizontal and Sobel Kernal Vertical)
% Values are taken from L4 (Lecture 4)
x_sobel = [-1,0,1;-2,0,2;-1,0,1];
y_sobel = [-1,-2,-1;0,0,0;1,2,1];

% Need to zero any pixel that is not greater in terms of gradient magnitude
% than both pixels on either side of its gradient orientation
% https://en.wikipedia.org/wiki/Canny_edge_detector
%% First Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test00.png');

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(1);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test00");

%% Second Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test01.png');

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(2);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test01");

%% Third Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test02.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
Im = rgb2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(3);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test02");

%% Fourth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test03.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
Im = rgb2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(4);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test03");

%% Fifth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test04.jpg');

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(5);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test04");

%% Sixth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test05.jpg');

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.12;
high_threshold = 0.8;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(6);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of test05");

%% Seventh Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('task6_helipad.png');

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Performing non maxima suppression
low_threshold = 0.15;
high_threshold = 3.46;
binary_Image = myedge(Im, G, theta, low_threshold, high_threshold);

% Showing the gradient magnitude on screen as a greyscale image
figure(7);
imshow(binary_Image, 'InitialMagnification', 'fit');
title("Binary Image of helipad");

% % Demonstrate your understanding by answering the question below:
% Explain how you chose the threshold for non-maximal suppression?
% 
% The low_threshold parameter sets the minimum threshold value for an edge
% to be considered part of the output. Edges with gradient magnitudes 
% below this threshold are discarded.
% 
% The high_threshold parameter sets the maximum threshold value for 
% an edge to be considered part of the output, and is used to link edges
% together into continuous curves. If an edge has a gradient magnitude 
% above the high threshold, it is considered a strong edge. 
% If an edge has a gradient magnitude between the low and high thresholds, 
% it is considered a weak edge.
% 
% Basically what I did was I tried to estimate through trial and error and
% see whether i can tweek the value based on the above two explanation.