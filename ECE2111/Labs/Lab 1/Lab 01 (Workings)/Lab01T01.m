% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01T01

clear all;close all;clc

% Question 1
% Entering sqrt(1) to display the result
x = sqrt(-1);

% Question 2
% Enter 1+j and 1i + 1j and display the result
y = i + j;
z = 1i + 1j;

% Question 3
% Defining z1 = 1 + j by entering z1 = 1+1j

% Initialising z as 1 + j
z_1 = 1 + j;

% Magnitude
Magnitude = abs(z_1);

% Angle 
Angle = angle(z_1);

% Real Number
Real = real(z_1);

% Imaginary Number
Imaginary = imag(z_1);

% Question  4
% The phase is in radians. Angle(z_1)returns the phase angle in the 
% interval [-π,π] for each element of a complex array z .

% Question 5
z_2 = 2*exp((1j*pi)/3);

% Displaying the magnitude of z1+z2
z_ans = z_1 + z_2;
abs_ans = abs(z_ans);

% Question 6
% Plotting the complex number z2 = 2*exp(j*pi/3)
z_3 = 2*exp((1j*pi)/3);
figure
x = real(z_3);
y = imag(z_3);
scatter(x,y);
title("Imaginary Part Vs Real Part")
xlabel("Real Part")
ylabel("Imaginary Part")


