% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: Lab1_Task1
% Purpose of the file: Implement Gaussian Blur
% Write a program that performs Gaussian blur on an input image using the
% following 5x5 kernel, where B is the blurred version of input image Im.

% Code should not use a pre-existing conv function

clear all;close all;clc;

% Defining the Gaussian kernel
matrix = [2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2];
const = 1/159;
kernel = const .* matrix;

%% Task 1 First Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test00.png');

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(1);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 00 Gaussian Blur Image");

%% Task 1 Second Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test01.png');

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(2);
imshow(B , 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 01 Gaussian Blur Image");

%% Task 1 Third Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test02.png');

% Converting RGB to greyscale (If not you will have a red background)
Im = rgb2gray(Im);

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(3);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 02 Gaussian Blur Image");

%% Task 1 Fourth Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test03.png');

% Converting RGB to greyscale (If not you will have a red background)
Im = rgb2gray(Im);

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(4);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 03 Gaussian Blur Image");

%% Task 1 Fifth Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test04.jpg');

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(5);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 04 Gaussian Blur Image");

%% Task 1 Sixth Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('test05.jpg');

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(6);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Test 05 Gaussian Blur Image");

%% Task 1 Seventh Image
% Declaring and intialising the variable
% Using imread to read the given image
Im = imread('task6_helipad.png');

% convolving the two objects together
B = myconv(Im,kernel);

% Displaying the figure
figure(7);
imshow(B, 'InitialMagnification', 'fit');

% Labelling the figure
title("Task 6 Gaussian Blur Image");


