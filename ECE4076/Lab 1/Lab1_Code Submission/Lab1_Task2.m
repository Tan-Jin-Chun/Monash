% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task2
% Purpose of the file: Calculate Image Gradient

clear all;close all;clc;

% Defining and initialising the variables
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

% Checking the x and y gradient valeus to make sure that they are correct
figure(1);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test00");
figure(2);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test00");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(3);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test01");
figure(4);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test01");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(5);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test02");
figure(6);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test02");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(7);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test03");
figure(8);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test03");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(9);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test04");
figure(10);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test04");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(11);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of test05");
figure(12);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of test05");

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

% Checking the x and y gradient valeus to make sure that they are correct
figure(13);

% [] argument scales the pixel values of the image to span the full range of the colormap
% if not it will not properly display the image and it will not have a
% uniform colour distribution
imshow(Gx, [], 'InitialMagnification', 'fit');
title("Gx of helipad");
figure(14);
imshow(Gy, [], 'InitialMagnification', 'fit');
title("Gy of helipad");

%% Demonstrate your understanding by answering the question below:
% Looking at the filter coefficients, explain how a sobel filter picks out horizontal edges?

% The Sobel filter picks out horizontal edges by computing the horizontal gradient of the image,
% which represents the rate of change of brightness in the horizontal direction. 
% By looking for areas where the horizontal gradient is high, 
% the filter is able to identify horizontal edges in the image.