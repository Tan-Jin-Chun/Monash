%%
close all; clear all;clc;
load ('assignment_data.mat');
Fs = 120; % in Hz
t = C1(:,1);
left = C1(:,2);
right = C1(:,3);
%%

% plotting VGRF against time (5 seconds)
begin_time = 1*Fs+1;
number_of_seconds = 5;
indexes = begin_time:begin_time+number_of_seconds*Fs;
time_5_sec = t(indexes);
left_5_sec = left(indexes);
right_5_sec = right(indexes);


figure(1);
plot(time_5_sec, left_5_sec, time_5_sec, right_5_sec);
title('VGRF against time');
xlabel('time in seconds');
ylabel('VGRF in newtons');
legend('left', 'right');

% plotting the left VGRF signal in frequncy domain
N = length(left);
LEFT = (1/N)*fft(left);
kX = -floor(N/2):(N-1-floor(N/2));

figure(2); 
stem(kX, fftshift(abs(LEFT)));
title('Frequency domain plot of the left VGRF signal');
ylabel('magnitude');
xlabel('k (multiple of fundemental frequency)');


LEFT = fft(left);
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);
figure(3); 
plot(omega, fftshift(abs(LEFT)));
title('Frequency domain plot of the left VGRF signal');
ylabel('magnitude');
xlabel('frequency in Hz');

LEFT = fft(left);
omega = (-floor(N/2):(N-1-floor(N/2)))*(2*pi/N);
figure(4); 
plot(omega, fftshift(abs(LEFT)));
title('Frequency domain plot of the left VGRF signal');
ylabel('magnitude');
xlabel('frequency in rad/sample');

% plotting the right VGRF signal in frequncy domain
N = length(right);
RIGHT = (1/N)*fft(right);
kX = -floor(N/2):(N-1-floor(N/2));

figure(5); 
stem(kX, fftshift(abs(RIGHT)));
title('Frequency domain plot of the right VGRF signal');
ylabel('magnitude');
xlabel('k (multiple of fundemental frequency)');

RIGHT = fft(right);
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);
figure(6); 
plot(omega, fftshift(abs(RIGHT)));
title('Frequency domain plot of the right VGRF signal');
ylabel('magnitude');
xlabel('frequency in Hz');

RIGHT = fft(right);
omega = (-floor(N/2):(N-1-floor(N/2)))*(2*pi/N);
figure(7); 
plot(omega, fftshift(abs(RIGHT)));
title('Frequency domain plot of the left VGRF signal');
ylabel('magnitude');
xlabel('frequency in rad/sample');


%% Answer to the question
% Based on figure 1, we are able to identify the threshold of the VGRF value,
% below which the foot is off the ground, and above which corresponds to the foot
% being on the ground. When the foot sets on the ground as shown in heel strike
% and foot flat phase, the force being exerted on the measuring device is the greatest. 
% Therefore, VGRF value should be high when the foot sets on the ground.
% Based on the graph, the effects of noise makes the signal vary by +- 100 N, 
% there is a clear distinction between a HIGH, and a LOW phase during a gait. 
% A magnitude of 400N for VGRF signal could be the threshold. For values > 400N,
% means the foot is on the ground, otherwise, the foot is off the ground.