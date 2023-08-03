% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task3
% Purpose of the file: Calculate gradient magnitude

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

% Loading the image from the hard drive as a grayscale (single channel
% image)
% Im = rgb2gray(Im);
Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(1);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test00");

%% Second Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test01.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
% Im = rgb2gray(Im);
Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(2);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test01");

%% Third Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test02.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
Im = rgb2gray(Im);
% Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(3);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test02");

%% Fourth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test03.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
Im = rgb2gray(Im);
% Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(4);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test03");

%% Fifth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test04.jpg');

% Loading the image from the hard drive as a grayscale (single channel
% image)
% Im = rgb2gray(Im);
Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(5);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test04");

%% Sixth Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('test05.jpg');

% Loading the image from the hard drive as a grayscale (single channel
% image)
% Im = rgb2gray(Im);
Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(6);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of test05");

%% Seventh Image
% Declaring and intialising the variable
% Using imread to read the given image and store it in a variable
Im = imread('task6_helipad.png');

% Loading the image from the hard drive as a grayscale (single channel
% image)
% Im = rgb2gray(Im);
Im = im2gray(Im);

% convolving the two objects together (Blurring the image using a 5x5 Gaussian Filter)
B = myconv(Im,kernel);

% Calculating the gradient of the blurred image in the x and y direction
% using a 3x3 Sobel Filter
Gx = myconv(B,x_sobel);
Gy = myconv(B,y_sobel);

% Calculate the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);

% Showing the gradient magnitude on screen as a greyscale image
figure(7);
imshow(G,[], 'InitialMagnification', 'fit');
title("Gradient Magnitude of helipad");

% % Demonstrate your understanding by answering the question below:
% 
% What differences in gradient magnitude would be observed for a corner, edge and solid region?
% The gradient magnitude is a measure of how quickly the intensity of an image changes in a given direction. For example, a high gradient magnitude indicates a rapid change in intensity, 
% while a low gradient magnitude indicates a slow or no change in intensity.
% 
% When we consider a corner, an edge, and a solid region, 
% we can observe different patterns of gradient magnitude due to the variations in the rate of change of intensity in different directions.
% 
% Corner: In a corner, 
% the intensity changes rapidly in both horizontal and vertical directions, 
% resulting in a high gradient magnitude in both directions. 
% The gradient magnitude is highest at the corner point and
% gradually decreases as we move away from the corner. 
% Thus, a corner will show high gradient magnitudes in multiple directions.
% 
% Edge: In an edge, the intensity changes rapidly in only one direction, 
% resulting in a high gradient magnitude in that direction and 
% a low gradient magnitude in the perpendicular direction. 
% Thus, an edge will show high gradient magnitudes in only one direction.
% 
% Solid Region: In a solid region, there is no or very little change in intensity,
% resulting in a low gradient magnitude in all directions.
% Thus, a solid region will show low gradient magnitudes in all directions.
% 
% To summarize, a corner will show high gradient magnitudes in multiple directions, 
% an edge will show high gradient magnitudes in only one direction, 
% and a solid region will show low gradient magnitudes in all directions.
% These differences in gradient magnitude can be used to detect corners,
% edges, and solid regions in an image, which is useful in various image processing applications 
% such as feature detection, object recognition, and segmentation.