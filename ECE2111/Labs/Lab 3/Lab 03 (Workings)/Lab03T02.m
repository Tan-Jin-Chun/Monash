% Written by Tan Jin Chun
% Last Modified : 2/9/2021
% Lab03T02

clear all;close all;clc

%% Question 1

% Initialising the variable
Fs = 8192;
Ts = 1/Fs;

% Time (Converting continuous time to discrete time)
t = 0:Ts:1;

% Loading the files
load dtmfclean.mat

%% Question 2
% Question 2(a)
% Listening to the sound (total of 6 sounds)
% soundsc(xdtmf1);
% soundsc(xdtmf2);
% soundsc(xdtmf3);
% soundsc(xdtmf4);
% soundsc(xdtmf7);
% soundsc(xdtmfa);

% Question 2(b)
% Getting the lengths of the signals
N1 = length(xdtmf1);
N2 = length(xdtmf2);
N3 = length(xdtmf3);
N4 = length(xdtmf4);
N7 = length(xdtmf7);
Na = length(xdtmfa);

% Computing the discrete time Fourier Series Coefficient
% Use the fft() function
X1 = (1/N1)*fft(xdtmf1);
X2 = (1/N2)*fft(xdtmf2);
X3 = (1/N3)*fft(xdtmf3);
X4 = (1/N4)*fft(xdtmf4);
X7 = (1/N7)*fft(xdtmf7);
Xa = (1/Na)*fft(xdtmfa);

% Figure X1
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
x1 = -floor(N1/2):(N1-1-floor(N1/2));
y1 = fftshift(abs(X1));
stem(x1, y1);

% Finding the indices of the discrete time Fourier Series that have a large
% magnitude
maxval = max(y1);
idx = find(y1 == maxval)

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmf1 signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Figure X2
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(N2/2):(N2-1-floor(N2/2)), fftshift(abs(X2)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmf2 signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Figure X3
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(N3/2):(N3-1-floor(N3/2)), fftshift(abs(X3)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmf3 signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Figure X4
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(N4/2):(N4-1-floor(N4/2)), fftshift(abs(X4)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmf4 signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Figure X7
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(N7/2):(N7-1-floor(N7/2)), fftshift(abs(X7)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmf7 signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Figure Xa
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(Na/2):(Na-1-floor(Na/2)), fftshift(abs(Xa)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of xdtmfa signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");

% Question 2(c)
% xdtmf1 = 
% xdtmf2 = 
% xdtmf3 = 
% xdtmf4 = 
% xdtmf7 = 
% xdtmfa = 

%% Question 3

%% Question 4
% Loading the files for dtmfnoisy.mat
load dtmfnoisy.mat

% The duration
% number of samples divided by sampling frequency
duration = length(ydtmf)/Fs;

% Ans is 2

%% Question 5
% Listening to the sounds
% soundsc(ydtmf);

%% Question 6
% Getting the lengths of the signals
Y = length(ydtmf);

% Computing the discrete time Fourier Series Coefficient
% Use the fft() function
Y1 = (1/Y)*fft(ydtmf);

% Figure y
% Plotting the magnitude of the fourier coefficient 
figure
% Plotting the magnitude
stem(-floor(Y/2):(Y-1-floor(Y/2)), fftshift(abs(Y1)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of ydtmf signal");
xlabel("n (time samples)");
ylabel("Magnitude of Fourier Series Coefficients");