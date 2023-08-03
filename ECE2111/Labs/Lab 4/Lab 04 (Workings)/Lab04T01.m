% Written by Tan Jin Chun
% Last Modified : 3/9/2021
% Lab04T01

clear all;close all;clc

%% Question 1
% Loading the signals
% Sampled at 256 samples/second
load ECG.mat;

%% Question 2
% Question 2(a)
% Getting the length of the signal
N = length(ECG);

% Computing the discrete time Fourier Series Coefficient
% Use the fft() function
X1 = (1/N)*fft(ECG);
X = fft(ECG);

% Figure X1
% Plotting the magnitude of the fourier coefficient 
figure;

% Plotting the magnitude
stem(-floor(N/2):(N-1-floor(N/2)), fftshift(abs(X1)));

% Labelling the graph
title("Discrete Time Fourier Series Coefficients of ECG signal");
xlabel("k (multiple of fundamental frequency)");
ylabel("Magnitude of Fourier Series Coefficients");

% Question 2(b)
% Plotting the representation of the discrete time Fourier transform
omega = (-floor(N/2):(N-1-floor(N/2)))*(2*pi/N);

% New figure
figure;
plot(omega, fftshift(abs(X)));
title("Discrete Time Fourier Series Representation of ECG signal");
xlabel("frequency in rad/sample");
ylabel("Magnitude of Fourier Series Representation");

% Question 2(c)
% Updated Omega value
Fs = 256;
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);

% New figure
figure;
plot(omega, fftshift(abs(X)));
title("Continuous Time Fourier Series Representation of ECG signal");
xlabel("frequency in Hz");
ylabel("Magnitude of Fourier Series Transform (Continuous Signal)");

%% Question 3
% The power line frequency is -50,0 and 50

%% Question 4
% Plotting the signal in the time domain that shows the signal well
% Getting the time domain
t = (0:length(ECG)-1) / Fs;

% Plotting the signal
figure;
plot(t,ECG);

% Setting the xlimit from 0 to 3 seconds
xlim([0 3]);

% Setting the labelling
xlabel("time in seconds");
ylabel("Continuous Signal");
title("ECG signal");
