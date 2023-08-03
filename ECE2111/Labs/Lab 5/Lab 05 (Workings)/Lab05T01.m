% Written by Tan Jin Chun
% Last Modified : 17/9/2021
% Lab05T01

clear all;close all;clc

%% Question 1
% Question 1
% Loading in the signal speech into the workspace
load lab5data.mat;

%% Question 2
% The sampling rate
Fs = 44100;

% The length of the signal
N = length(speech);
n = 0:N-1;

% Finding the average power of the signal speech
P = (speech' * speech)/N;

% Transposing speech
speech = speech';

% Creating a new signal called speechNoisy
% Getting the value of A
A = sqrt(0.2 * P);

%% Question 3
% Noise Signal 
Hz = 5000;
speechNoisy = speech + A*cos(2 * pi * Hz * n / Fs);
% speechNoisy = conv(speech, A*cos(2 * pi * Hz / Fs));

%% Question 4
% Playing the signal speechNoisy using soundsc
% soundsc(speech);
% pause
% soundsc(speechNoisy);
% pause

% Plotting the noisy signal in the frequency domain (magnitude only)
Nnoisy = length(speechNoisy);
Xnoisy = fft(speechNoisy);
omega = (-floor(Nnoisy/2):(Nnoisy-1-floor(Nnoisy/2)))*(2*pi/Nnoisy);
figure;
plot(omega, fftshift(abs(Xnoisy)));
xlabel("Frequency in Rad/Sample");
ylabel("Magnitude");
title("DTFT of Noisy Speech");

%% Question 5
% Downsampling the signal
% Factor of 5
L = 5;
xds = speechNoisy(1:L:end);
N = length(xds)*L;

% Playing the downsampled signal
% soundsc(xds);
% pause;

%% Question 6
% Reconstructing the original signal
xrecon = interp1(1:L:N,xds,1:N,"linear",0);

%% Question 7
% Playing the reconstructed signal using soundsc
% soundsc(xrecon);
% pause;

% Plotting the reconstructed signal
Nrecon = length(xrecon);
Xrecon = fft(xrecon);
omega = (-floor(Nrecon/2):(Nrecon-1-floor(Nrecon/2))) * (2*pi/Nrecon);
figure;
plot(omega, fftshift(abs(Xrecon)));
xlabel("Frequency in Rad/Sample");
ylabel("Magnitude");
title("Magnitude of DTFS Coefficient for Reconstructed Signal (speechNoisy)");

