% Written by Soon Foo Chong
clear all; close all; clc;

%% Hypercycloid
a = pi;
b = 1;
theta=linspace(0,50*pi,1000);

x = (a-b)*cos(theta).^2 + b*cos((a-b)*theta/b).^2;
y = (a-b)*sin(theta).^3 - b*sin((a-b)*theta/b).^3;

subplot(2,1,1)
plot(theta,x,theta,y)
xlabel('\theta')
ylabel('coordinate')
legend('x','y')

subplot(2,1,2)
plot(x,y,'-','color',[0.0353, 0.6941, 0.8588])
axis square
xlabel('x')
ylabel('y')
title('Hypercycloid')
