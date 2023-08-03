% Written by: Soon Foo Chong
close all;clear all;clc;

h = linspace(50,200,10);
v = linspace(25,100,10);
theta = 0:15:90;

c = h'*sind(theta) + v'*cosd(theta);
s = h'*cosd(theta) - v'*sind(theta);

plot(c,s);
title('Shear Force against Axial Force');
xlabel('Axial Force (N)');
ylabel('Shear Force (N)');
legend('\theta=0','\theta=15','\theta=30','\theta=45','\theta=60','\theta=75','\theta=90');