% Written by Tan Jin Chun
% Last Modified : 3/9/2021
% Lab04T02

clear all;close all;clc

% Question 1
% Loading the data
load ECG.mat;

% Designing low-pass filter to remove any high frequency noise above 40Hz
% Initialising the variable
% Lengths of the filters
L1 = 5;
L2 = 10;
L3 = 20;
Fs = 256;

% Getting the order of the signal
O1 = L1-1;
O2 = L2-1;
O3 = L3-1;
Order = [O1 O2 O3];

% Designing the low pass filters
% Using 49Hz and 51Hz as we want to filter out the Power line Frequency
% which is 50 Hz
Hz = [49 51];

% Omega in terms of pi
w = 2 * Hz / Fs;

% Using the firpm function to design the notch fitler
% Using a for loop to plot the six graphs
for i = 1:length(Order)
    
h = firpm(Order(i), [0, w, 1], [1,0,0,1]);

%% Question 2
    % Question 2(a)
    % String for the legend
    str = sprintf("Filtered Signal (%dth Order)", Order(i));
    
    % Applying the filter to my signal using the conv function
    y1 = conv(ECG, h);

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
    N1 = length(y1);
    X1 = fft(y1);
    omega1 = (-floor(N1/2):(N1-1-floor(N1/2)))*(Fs/N1);
    hold on
    plot(omega1, fftshift(abs(X1)),'r');
    legend("Unfiltered Signal", str);
    hold off

    %% Question 2(d)
    % Plotting the signal in the time domain that shows the signal well
    % Getting the time domain
    t = (0:length(ECG)-1) / Fs;

    % Plotting the signal
    figure;
    plot(t,ECG,'b');

    % Setting the xlimit from 0 to 3 seconds
    xlim([3 6]);

    % Setting the labelling
    xlabel("time in seconds");
    ylabel("Continuous Signal");
    title("ECG signal");

    % Plotting the filtered signal in the time domain
    t1 = (0:length(y1)-1) / Fs;
    hold on
    plot(t1, y1, 'r');
    legend("Unfiltered Signal", str);
    hold off
    
end
