% Written by Tan Jin Chun
% Last Modified : 2/9/2021
% Lab04T04

clear all;close all;clc

% Question 1
% Loading in the signal
load ECG.mat;

% Designing low-pass filter to remove any high frequency noise above 40Hz
% Initialising the variable
% Lengths of the filters
L1 = 50;
L2 = 100;
L3 = 200;
Fs = 256;

% Getting the order of the signal
O1 = L1-1;
O2 = L2-1;
O3 = L3-1;
Order = [O1 O2 O3];

% Designing the low-pass filters
Hz = [40 43];

% Omega in terms of pi
w = 2 * Hz / Fs;

% Question 2(a)
% Designing my high pass fitler using the firpm function
% Using a for loop to plot all 6 plots
for i = 1:length(Order)
    
    h = firpm(Order(i), [0, w, 1], [1,1,0,0]);

    %% Question 2
    % String for the legend
    str = sprintf("Filtered Signal (%dth Order)", Order(i));
    
    % Applying the filter using the conv function
    y2 = conv(ECG, h);

    % Question 2(b)
    % Plotting the signal in the frequency domain before and after filtering
    % Updated Omega value
    % Initialising the variable
    % Getting the length of the signal
    N = length(ECG);

    % Computing the discrete time Fourier Series Coefficient
    % Use the fft() function
    X = fft(ECG);

    % Getting the value of omega
    omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);

    % New figure
    figure;
    plot(omega, fftshift(abs(X)),'b');
    title("Continuous Time Fourier Series Representation of ECG signal");
    xlabel("frequency in Hz");
    ylabel("Magnitude of Fourier Series Transform (Continuous Signal)");

    % Initialising the variable for filtered signal
    N2 = length(y2);
    X2 = fft(y2);

    omega2 = (-floor(N2/2):(N2-1-floor(N2/2)))*(Fs/N2);

    % Plotting the filtered signal
    hold on
    plot(omega2, fftshift(abs(X2)),'r');
    legend("Unfiltered Signal", str);
    hold off

    %% Question 2(c)


    %% Question 2(d)
    % Plotting the signal in the time domain that shows the signal well
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

    % Plotting the filtered signal in the time domain
    t2 = (0:length(y2)-1) / Fs;
    hold on
    plot(t2, y2, 'r');
    legend("Unfiltered Signal", str);
    hold off
end

%% Question 2(e)

