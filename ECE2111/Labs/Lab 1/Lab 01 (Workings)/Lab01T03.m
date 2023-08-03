% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01T03

clear all;clc;close all

% Initialsing the variables
t = linspace(-10,10,201);
x0 = t.*exp(-1*abs(t));
xe = abs(t).*exp(-1*abs(t));
x = 0.5*(x0+xe);

% Plotting the graph in a subplot
subplot(3,1,1);
plot(t,x0);
title("Graph of x_0 vs t")
xlabel("time in seconds(s)")
ylabel("x_0(t)")
subplot(3,1,2);
plot(t,xe);
title("Graph of x_e vs t")
xlabel("time in seconds(s)")
ylabel("x_e(t)")
subplot(3,1,3);
plot(t,x)
title("Graph of x vs t")
xlabel("time in seconds(s)")
ylabel("x(t)")

% Question 5
t1 = linspace(0,1,101);
x1 = exp(1j*10*pi*t1);

% Plotting the graph
figure
% Plotting the real part of the graph
plot(t1,real(x1))

% Plotting the imaginary part of the graph
hold on
plot(t1,imag(x1))
hold off
title("Graph of real and imaginary parts of x_1 vs t")
xlabel("t (time in seconds)")
ylabel("x_1(t)")
legend("Real","Imaginary")




