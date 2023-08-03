% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02T04

clear all;close all;clc

% Question 1
% Loading the image matrix echart into the workspace
load echart;

% Question 2
% Displaying the image
imshow(echart);
title("echart")

% Question 3
% Getting the size of the image
% The image is 257 pixels high and 256 pixels wide as shown in the command
% window
size(echart)

% Question 4
% Adding noise to the image
echartnoisy = echart + 0.8*rand(size(echart));

% Question 5
% Displaying the image
figure
imshow(echartnoisy);
title("echartnoisy (item 5)")

% Question 
% Displaying the image again
figure
imshow(echartnoisy,[]);
title("echartnoisy (item 6)")

% One image has a black background and another image has a white
% blackground
% The difference between the image in item5 and item6 is item5
% is normal 
% noise added echart image and item6 is the gray image of the noise added 
% image of the echart image matrix
