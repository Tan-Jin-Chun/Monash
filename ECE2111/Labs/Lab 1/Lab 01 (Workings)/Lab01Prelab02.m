% Written by Tan Jin Chun
% Last Modified : 25/7/2021
% Lab01T03

clear all;close all;clc

% Prelab Question 2

% Initialising the variable
ty = -2:0.01:2;
y = (ty).^2;

% Getting the length of vector y
leng_y = length(y);

% Plotting the graph of the prelab question
plot(ty,y);
title("Graph of y vs time");
xlabel("t(time in seconds)");
ylabel("y(t)");

% Printing the value out
fprintf("The length of vector y is %.f",leng_y);