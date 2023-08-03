% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab2_Task2
% Function of the file: Drawing the stated points onto the left image as
% red crosses

clear all;clc;close all;

% Declaring and intialising the variable
% Using imread to read the given right image
right_image = imread("right.jpg");

% The stated positions
stated_points = [338,197,1;
                 468,290,1;
                 253,170,1;
                 263,256,1;
                 242,136,1];

% The homography
homography = [1.6010, -0.0300, -317.9341;
              0.1279, 1.5325,  -22.5847;
              0.0007, 0,       1.2865];

% The transformed points
% Applying the homography to transform the left image to the corresponding
% locations in the right image
transformed_points = (homography * stated_points')';

% Getting the 2-D Red Crosses by transforming the 3-element homogenous
% coordinates to 2D image pixel coordinates by dividing the first and
% second elements by the third elements
red_crosses = [transformed_points(:,1) ./ transformed_points(:,3), transformed_points(:,2) ./ transformed_points(:,3)];

% Plotting the red crosses
figure(1);
imshow(right_image, 'InitialMagnification','fit');
hold on;
axis on;
for i = 1:5
    plot(red_crosses(i,1), red_crosses(i,2), 'rx');
end
hold off;
title("Right Image");
xlabel("x");
ylabel("y");