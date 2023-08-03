% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab2_Task1
% Function of the file: Drawing the stated points onto the left image as
% red crosses

clear all;clc;close all;

% Declaring and intialising the variable
% Using imread to read the given left image
left_image = imread("left.jpg");

% The stated positions
stated_points = [338,197,1;
                 468,290,1;
                 253,170,1;
                 263,256,1;
                 242,136,1];

% Getting the 2-D Red Crosses by transforming the 3-element homogenous
% coordinates to 2D image pixel coordinates by dividing the first and
% second elements by the third elements
red_crosses = [stated_points(:,1) ./ stated_points(:,3), stated_points(:,2) ./ stated_points(:,3)];

% Plotting the red crosses
figure(1);
imshow(left_image, 'InitialMagnification','fit');
hold on;
axis on;
for i = 1:5
    plot(red_crosses(i,1), red_crosses(i,2), 'rx');
end
hold off;
title("Left Image");
xlabel("x");
ylabel("y");

