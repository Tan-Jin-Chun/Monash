% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task4
% Purpose of the file: Calculate gradient orientation

clear all;close all;clc;

% Defining the Gaussian kernel
matrix = [2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2];
const = 1/159;
kernel = const .* matrix;

% Defining the Sobel Filter (Sobel Kernel Horizontal and Sobel Kernal Vertical)
% Values are taken from L4 (Lecture 4)
x_sobel = [-1,0,1;-2,0,2;-1,0,1];
y_sobel = [-1,-2,-1;0,0,0;1,2,1];

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(1);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test00");

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(2);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test01");

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(3);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test02");

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(4);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test03");

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(5);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test04");

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

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(6);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of test05");

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

% Calculating the gradient orientation
theta = atan2d(-Gy, Gx);

% % Gradient orientations should be rounded to the nearest 45 degrees
theta = round(theta./45)*45;
theta(theta == 180) = -180;

% Showing the gradient magnitude on screen as a greyscale image
figure(7);
imagesc(theta);
% colourmap(theta);
colorbar;
title("Gradient Orientation of helipad");

% % Demonstrate your understanding by answering the question below:
% How could the gradient orientation be used to obtain rotational invariance for patch matching?
% In patch matching, it is often desirable to achieve rotational invariance,
% which means that the matching algorithm should be able to find correspondences
% between patches regardless of their orientation or rotation. 
% One way to achieve this is by using the gradient orientation of the patches.
% 
% The gradient orientation of patches can be used to obtain rotation-invariant representations of patches for matching.
% By comparing the histograms of gradient orientations,
% we can achieve robust patch matching even when the patches are rotated or oriented differently.