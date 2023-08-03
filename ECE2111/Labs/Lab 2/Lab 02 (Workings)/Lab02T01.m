% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02T01

clear all;close all;clc

% Question 2(a)
% Calling the dtimpulse() function
[x,nx] = dtimpulse(0, 0, 0);

% Question 2(b)
% Initialising the variable
h = [1:1:3, 3:-1:1];
nh = -2:3;

% Question 2(c)
% Calling the myconv() function
[y, ny] = myconv(x, nx, h, nh)

% Question 2(d)
% Callling thr myconv() function again, this time with the order of the
% input flipped
[y0, ny0] = myconv(h, nh, x, nx)

% Both of the output has the same values
% This means that the commutative property holds true
% x(n)*h(n) = h(n)*x(n)

% Question 2(e)
% Initialising the variable
x = [1 1 1];
nx = 2:4;

% Output
[y1, ny1] = myconv(x, nx, h, nh)
[y2, ny2] = myconv(h, nh, x, nx)

% Both of the output has the same values
% This means that the commutative property holds true
% x(n)*h(n) = h(n)*x(n)



