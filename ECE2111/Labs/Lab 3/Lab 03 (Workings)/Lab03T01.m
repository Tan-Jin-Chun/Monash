% Written by Tan Jin Chun
% Last Modified : 2/9/2021
% Lab03T01

clear all;close all;clc

%% Question 1
% Initialising the variables
n = 0:79;

% Sampling frequency
Fs = 160;

% Time (Converting continuous time to discrete time)
t = n./Fs;

% Equation
x = cos(4*pi.*t);

% Initialising variable y
y = size(n);

% Need to generate the signal from 1 to 80, use a for loop for that
% (u[n]-u[n-80])
for i = 1:80
    
    % All of the rows from 1 to 80 will be filled with ones
    y(1,i) = 1;
    
end

% Getting the formula of z
z = x.*y;

% Plotting the stem plot 
stem(n,z);
xlabel("n (time in samples)");
ylabel("z[n]");
title("Plot of z[n] against n (stem plot of z)");

%% Question 2 
% Initialising the variables
n_extend = 0:159;

% Converting from discrete time to continous time
t = n_extend./Fs;

% Initialising variable z_periodic
z_periodic = size(n_extend);

% Using back the old formula above
% First half is the same
z_periodic(1,1:80) = z;

% The second half is also the same
z_periodic(1,81:160) = z;

% Plotting the stem plot 
figure
stem(n_extend,z_periodic);
xlabel("n (time in samples)");
ylabel("z[n] periodic");
title("Plot of z[n] periodic against n (stem plot of periodic extension of z)");

%% Question 3
% Period of 80
% Getting the length of z_periodic
N = length(z);

% Computing the discrete time Fourier Series Coefficient
% Use the fft() function
X = (1/N)*fft(z);

% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(N/2):(N-1-floor(N/2)), fftshift(abs(X)));

% Labelling the graph
title("Magnitude of DTFS coefficients of z");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% % Plotting the phase of the Fourier Series
% hold on
% stem(-floor(N/2):(N-1-floor(N/2)), fftshift(angle(X)));
% hold off
%%  Question 4
% Stem plot for w[n] = xs[n](u[n]-u[n-70])
n_new = 0:69;

% Time (Converting continuous time to discrete time)
t_new = n_new./Fs;

% Equation
x_new = cos(4*pi.*t_new);

% Initialising variable y
y_new = size(n_new);

% Need to generate the signal from 1 to 70, use a for loop for that
% (u[n]-u[n-70])
for i = 1:70
    
    % All of the rows from 1 to 80 will be filled with ones
    y_new(1,i) = 1;
    
end

% Getting the formula of z
w = x_new.*y_new;

% Plotting the stem plot 
figure
stem(n_new,w);
xlabel("n (time samples)");
ylabel("w[n]");
title("Plot of w[n] against n");

%% Question 5
% Initialising the variables
n_extend_new = 0:139;

% Converting from discrete time to continous time
t_extend_new = n_extend_new./Fs;

% Equation
x = cos(4*pi.*t_extend_new);

% Initialising variable z_periodic
w_periodic = size(n_extend_new);

% Using back the old formula above
% First half is the same
w_periodic(1,1:70) = w;

% The second half is also the same
w_periodic(1,71:140) = w;

% Plotting the stem plot 
figure
stem(n_extend_new,w_periodic);
xlabel("n (time samples)");
ylabel("w[n] periodic");
title("Plot of w[n] periodic against n");

%% Question 6
% Period of 70
N = length(w);

% Computing the discrete time Fourier Series Coefficient
% Use the fft() function
X_new = (1/N)*fft(w);

% Plotting the magnitude of the fourier coefficient 
% Since N is odd, so (N-1)/2
figure;

% Plotting the magnitude of the fourier coefficient
stem(-floor((N)/2):(N-1-floor((N)/2)), fftshift(abs(X_new)));

% Labelling the graph
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");
title("Discrete Time Fourier Series Coefficients of w");

% Plotting the phase of the Fourier Series
% hold on
% stem(-floor((N-1)/2):(N-1-floor((N-1)/2)), fftshift(angle(X_new)));
% hold off