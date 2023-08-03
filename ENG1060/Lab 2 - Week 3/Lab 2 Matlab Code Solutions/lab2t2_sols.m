% Written by: Soon Foo Chong
close all; clear all; clc;  
%%
% 1
x = 0:1:15;
w1 = 4*cos(x+exp(-x.^2));
w2 = 5*sin(3*x+(pi/2));
w3 = w1 + w2;

plot(x,w1,'b--',x,w2,'r-.',x,w3,'k-')

xlabel('x')
ylabel('w')
legend('w_1','w_2','w_3')
title('w against x with increment of 1')

% hold on
% plot(x,w2,'r-.')
% plot(x,w3,'k-')
%%
% 2
x=0:0.01:15;
w1 = 4*cos(x+exp(-x.^2));
w2 = 5*sin(3*x+(pi/2));
w3 = w1 + w2;

figure
plot(x,w1,'b--')
hold on
plot(x,w2,'r-.')
plot(x,w3,'k-')
xlabel('x')
ylabel('w')
legend('w_1','w_2','w_3')
title('w against x with increment of 0.01')