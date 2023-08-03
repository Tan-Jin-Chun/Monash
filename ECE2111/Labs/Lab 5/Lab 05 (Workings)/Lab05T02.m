% Written by Tan Jin Chun
% Last Modified : 17/9/2021
% Lab05T02

clear all;close all;clc

%% Question 1
% Loading in the signal
load lab5data.mat;

% Reconstructing back the speechNoisy signal from the previous section
% Getting the length of the signal
N = length(speech);
n = 0:N-1;
Fs = 44100;

% Finding the average power of the signal speech
P = (speech' * speech)/N;

% Transposing speech
speech = speech';

% Creating a new signal called speechNoisy
% Getting the value of A
A = sqrt(0.2 * P);
Hz = 5000;
speechNoisy = speech + A*cos(2 * pi * Hz * n / Fs);

%% Question 2
% Constructing the Anti-Aliasing Filter (Low-Pass Filter)
Cutoff_Freq = [0 0.15 0.2 1];

% Using the firpm function to create the filter
h = firpm(100, Cutoff_Freq, [1,1,0,0]);

% Plotting the magnitude and the phase response of the filter using freqz
% function
figure;
freqz(h,1);
title("Magnitude and Phase Response of the Filter");

%% Question 3
% Filter the signal by convolving the signal and the filter
speechNoisyAa = conv(speechNoisy, h);
Na = length(speechNoisyAa);

%% Question 4
% Plotting the speechNoisyAa in the frequency domain (Magnitude Only)
Xnoisya = fft(speechNoisyAa);
omegaAa = (-floor(Na/2):(Na-1-floor(Na/2)))*(2*pi/Na);
figure;
plot(omegaAa, fftshift(abs(Xnoisya)));
xlabel("Frequency in Rad/Sample");
ylabel("Magnitude");
title("DTFT Coefficients of Signal (speechNoisyAa)");

%% Question 5
% Downsampling the signal by a factor of 5
L = 5;
xdsAa = speechNoisyAa(1:L:end);
NA_Downsampled = length(xdsAa);

%% Question 6
% Playing the downsampled signal 
% soundsc(xdsAa);
% pause;
% Plotting the filtered noisy signal in the frequency domain
XnoisyDa = fft(xdsAa);
omegaDAa = (-floor(NA_Downsampled/2):(NA_Downsampled-1-floor(NA_Downsampled/2)))*(2*pi/NA_Downsampled);
figure;
plot(omegaDAa, fftshift(abs(XnoisyDa)));
xlabel("Frequency in Rad/Sample");
ylabel("Magnitude");
title("DTFS Coefficient of Down-Sampled Filtered Signal (speechNoisyAa)");

%% Question 7
% Reconstructing the original signal by linear interpolation using interp1
% Reconstructing the original signal
xrecon = interp1(1:L:Na,xdsAa,1:Na,"linear",0);

% Playing the reconstructed signal using soundsc
% soundsc(xrecon);
% pause;

% Plotting the reconstructed signal in the frequency domain (magnitude only)
Nrecon = length(xrecon);
Xrecon = fft(xrecon);
omega = (-floor(Nrecon/2):(Nrecon-1-floor(Nrecon/2))) * (2*pi/Nrecon);
figure;
plot(omega, fftshift(abs(Xrecon)));
xlabel("Frequency in Rad/Sample");
ylabel("Magnitude");
title("DTFS Coefficient for Reconstructed Signal (speechNoisyAa)");
