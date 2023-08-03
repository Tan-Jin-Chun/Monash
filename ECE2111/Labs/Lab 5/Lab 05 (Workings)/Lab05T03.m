clear; clc;close all;

% Lab05T03
%% Part A
% Plot of continuous time signal x(t)
fs = 10000;
t = 0:1/fs:2;
fm = 440;
x_t = cos(2*pi*fm*t);
figure;
subplot(2,1,1)
plot(t,x_t)
xlabel 'Time'
ylabel 'Amplitude'
title 'Plot of Continuous time Signal'
grid on
xlim([0 0.01])
% ylim([0 0.01])

sprintf('The Nyquist Frequnecy (2 * fm) = %d Hz',2*fm)

% Plot of Disctrete time signal x(n)
fs_1 = 1000;
n = 0:1/fs_1:2;
x_n = cos(2*pi*fm*n);
subplot(2,1,2)
stem(n,x_n)
xlabel 'Sample'
ylabel 'Amplitude'
title 'Plot of Discrete Signal fs = 1000'
grid on
xlim([0 0.01])
% ylim([0 0.01])

soundsc(x_n,fs_1);
pause
%% Part B
% Plot of continuous time signal x(t)
fs = 10000;
fm=880;
t = 0:1/fs:2;
x_t = cos(2*pi*fm*t);
figure;
subplot(2,1,1)
plot(t,x_t)
xlabel 'Time'
ylabel 'Amplitude'
title 'Plot of Continuous time Signal'
grid on
xlim([0 0.01])
% ylim([0 0.01])

% Plot of Disctrete time signal x(n)
fs_1 = 1000;
n = 0:1/fs_1:2;
x_n = cos(2*pi*fm*n);
subplot(2,1,2)
stem(n,x_n)
xlabel 'Sample'
ylabel 'Amplitude'
title 'Plot of Discrete Signal fs = 1000'
grid on
xlim([0 0.01])
% ylim([0 0.01])
soundsc(x_n,fs_1);
pause
%% Part C
% Reading clarinet.wav
[c1 fs] = audioread('clarinet.wav');
Size_in_sec = length(c1)/fs;
sprintf('The sampling rate used to sample the signal is = %d Hz',fs)
%% Part D
% plotting clarinet signal on 1 <= t<= 1.025
t = 1*fs:1:1.025*fs;
sig = c1(t);
t_sec = (1./fs)*t;
figure;
plot(t_sec,sig)
xlabel 'Time(Sec)'
ylabel 'Amplitude'
title 'Plot of clarinet.wav'
grid on

%%
ff = linspace(-fs/2,fs/2,length(c1));
figure;
plot(ff,abs(fftshift(fft(c1))));
xlabel 'Freq'
ylabel 'Amplitude'
title 'Plot of spectrum of clarinet.wav'
grid on