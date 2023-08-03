% Written by Tan Jin Chun
% Last Modified : 25/7/2021
% Lab01T05

clear all;clc;close all

% Part 2
% Checking if my sumsys() function is working
nin1 = 0:3;
nin2 = 0:3;
x1 = [1 0 0 0];
x2 = [1 2 3 4];

% Calling the sumsys() function
[y1, nout] = sumsys(x1, nin1, x2, nin2);

% Part 4
% Checking if my delaysys() function is working or not
N = 2;
x = [1 0 0 0];
nx = 0:3;

% Calling the delaysys() function
[y2, ny] = delaysys(N, x, nx);

% If N=4, the signal will be all zero
N = 4;

% Calling the delaysys() function again
[y3, ny1] = delaysys(N, x, nx);

% Part 6
% Loading the .mat file
load AUDUSD

% Testing the threepointaverage() function
[y, ty] = threepointaverage(aud, taud);

% Plotting the subplot
subplot(2,1,1);
plot(taud,aud);
title("AUD USD daily exchange rate July 1,2015");
xlabel("time (days after July 1, 2015)");
ylabel("USD");

% Setting the vertical axis limit
ylim([0.68, 0.8]);

% Plotting the next subplot
subplot(2,1,2);
plot(ty,y);
title("Smoothed AUD USD daily exchange rate July 1, 2015 to June 30, 2017");
xlabel("time (days after July 1, 2015)");
ylabel("USD");

% Setting the vertical axis limit
ylim([0.68,0.8])




