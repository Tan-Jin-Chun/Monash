% Written by Tan Jin Chun
% Last Modified : 2/9/2021
% Lab03T03

clear all;close all;clc

%% Question 1

% Loading the signal
[y, Fst] = audioread('trumpet.wav');

%% Question 2
% Getting the total number of samples
% Sampling Rate * Time
M = Fst * 30e-3;

%% Question 3
% Getting the value of P
P = length(y)/M;

% Using the reshape built-in function to reshape my signal
yseg = reshape(y, [M, P]);

%% Question 4
% Yseg corresponds to the discrete time Fourier Series coefficients
% Getting the lengths of the signals
N = length(y);

% Preallocating Yseg for effieciency
Yseg = zeros(size(yseg));

% Computing the discrete time Fourier Series Coefficient for yseg
% Use the fft() function
% Using a for loop 
for i = 1:P
    Yseg(:,i) = (1/M)*fft(yseg(:,i));
end

% Using the reshape built-in function to reshape my signal
% Yseg = reshape(X,[M,P]);
% figure;
% stem(-floor(N/2):(N-1-floor(N/2)), fftshift(abs(Yseg)));
% plot(Yseg)
%% Question 5
% Getting the maximum value of Yseg
maxval = max(max(abs(Yseg)));

%% Question 6
% Initialising the variable
threshold = 0.01;

% Making a new array of Fourier Series coefficients
Ysegtrunc = Yseg.*(abs(Yseg) > threshold*maxval);
% plot(Ysegtrunc);

%% Question 7
% Converting a sparse storage format in Matlab
Ysegtrunc = sparse(Ysegtrunc); 

% Finding out how much memory the Ysegtrunc variable requires
% It requires 833816 bytes
whos Ysegtrunc

% Comparing with the memory that is required to store y
% It requires 27789464 bytes
whos y

%% Question 8
% Question 8(a)
% Converting Ysegtrunc back from the sparse data format to normal data
% format
Ysegtrunc = full(Ysegtrunc);

% Converting the columns of Ysegtrunc back into time domain signal using
% ifft
% Using a for loop
% Preallocation
X = zeros(size(Ysegtrunc));

% Using a for loop 
for i = 1:P
    X(:,i) = ifft(M*Ysegtrunc(:,i)); 
end

% % Question 8(b)
% % Reshaping back the signal into a single vector
ytrunc = reshape(X, [1, M*P]);

% Question 8(c)
% Playing signal y
% soundsc(y);
% pause
% 
% % Playing signal ytrunc
% soundsc(ytrunc);
% pause

% Question 8(d)
% First Plot
time_interval = 99.5*M:101.5*M;
figure;
plot(time_interval, y(time_interval)');
xlabel("time (samples)");
ylabel("signal");
title("signal and compressed signal over an interval containing a segment boundary");
hold on;
plot(time_interval, ytrunc(time_interval));
legend("signal","compressed signal");
hold off;

% Second Plot
% Initialising the variables
time = 0:length(y)-1;
error = ytrunc - y';
figure;
plot(time, error);
xlabel("time (samples)");
ylabel("error");
title("difference of signal and compressed version");