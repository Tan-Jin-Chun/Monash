% Written By Tan Jin Chun
% Last Modified: 15/5/2022
% Question 1f

clc;clear;close all;
syms n;

x = -12:0.01:12;
F = symsum((1/n)*((3*sin(n*pi/4) + sin(3*n*pi/4) - sin(n*pi/2))*(cos(n*pi*x/4))),n,1,3);
y = 1 + (2/pi) * F;
figure;
plot(x,y,'k-');
xlabel("x");
ylabel("f(x)");
title("Partial Sum (S3)");

x = -12:0.01:12;
F = symsum((1/n)*((3*sin(n*pi/4) + sin(3*n*pi/4) - sin(n*pi/2))*(cos(n*pi*x/4))),n,1,60);
y = 1 + (2/pi) * F;
figure;
plot(x,y,'k-');
xlabel("x");
ylabel("f(x)");
title("Partial Sum (S60)");




