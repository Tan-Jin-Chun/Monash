% Written by Tan Jin Chun
% Last Modified : 2/9/2021
% Lab04T05

clear all;close all;clc

% Loading in the ECG.mat signal
load ECG.mat;

% Question 1
% First System (Bandstop Filter)
% Sampling Rate
Fs = 256;

% Omega in terms of pi
w1 = 2 * [49 51] / Fs;
w2 = 2 * [0.6 1] / Fs;
w3 = 2 * [40 43] / Fs;

% Using the firpm function to design the notch fitler
h1 = firpm(19, [0,w1,1], [1,0,0,1]);

% Second System (high-pass filter)
h2 = firpm(499, [0,w2,1], [0,0,1,1]);

% Third System (low-pass filter)
h3 = firpm(199, [0,w3,1], [1,1,0,0]);

% Using the conv function for the series interconnection of the three
% system
y1 = conv(ECG, h1);
y2 = conv(y1, h2);
y3 = conv(y2, h3);

% Plotting the frequency domain graph
% Question 2(b)
% Plotting the signal in the frequency domain before filtering
N = length(ECG);
X = fft(ECG);

% Updated Omega value
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);

% New figure
figure;
plot(omega, fftshift(abs(X)),'b');
title("Continuous Time Fourier Series Representation of ECG signal");
xlabel("frequency in Hz");
ylabel("Magnitude of Fourier Series Transform (Continuous Signal)");

% Plotting the signal in the frequency domain after filtering
N1 = length(y3);
X1 = fft(y3);
omega1 = (-floor(N1/2):(N1-1-floor(N1/2)))*(Fs/N1);
hold on
plot(omega1, fftshift(abs(X1)),'r');
legend("Unfiltered Signal","Filtered Signal");
hold off

% Plotting the time domain graph
% Getting the time domain
t = (0:length(ECG)-1) / Fs;

% Plotting the signal
figure;
plot(t, ECG, 'b');

% Setting the xlimit from 0 to 3 seconds
xlim([3 6]);

% Setting the labelling
xlabel("time in seconds");
ylabel("Continuous Signal");
title("ECG signal");

% Plotting the filtered signal
t3 = (0:length(y3)-1) / Fs;
hold on
plot(t3, y3, 'r');
legend("Unfiltered Signal","Filtered Signal")
hold off

% Question 2 and Question 3
% Using the function findpeaks and finding the appropriate threshold and 
% Selecting the appropriate threshold to select only the peaks that
% correspond to R-peaks
threshold = 0.5;
[pks,locs] = findpeaks(y3, 'MinPeakHeight', threshold);

% Question 4
max_loc = max(t)*Fs;
min_loc = min(t)*Fs;
plot_loc = locs(locs <= max_loc & locs >= min_loc);
plot_pks = pks(locs <= max_loc & locs >= min_loc);

% Plotting the figure
figure;
plot(t3,y3);
xlabel("time in seconds");
ylabel("Signal Data");
title("Filtered ECG Signal");
hold on
plot(plot_loc/Fs,plot_pks,'x');
legend("Filtered Signal", "Peaks");
hold off
xlim([3 6]);

% Question 5
% Calculating the sequence of time intervals between successive R-peaks
% called (R-R peaks)
HBS_interval = diff(locs./Fs);
 
% Question 6
% BPM is calculated using 60/rr-interval
BPMS_interval = 60./HBS_interval;
BPM_second = mean(BPMS_interval);
fprintf("The average heartbeat per minute (BPM) is %.2f\n", BPM_second);

