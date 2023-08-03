% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02T03

clear all;close all;clc

% Question 3(a)
% Loading an audio file
[trumpet, trumpetFs] = audioread("trumpet.wav");

% Getting the length of the signal and the sampling frequency of the signal
len_trumpet = length(trumpet);
freq_trumpet = trumpetFs;
soundsc(trumpet);

% Question 2
[hSports, hSportsFs] = audioread('sportscentre.wav');
freq_hSports = hSportsFs;

% Question 2(a)
% Calling the function
trumpetSports = conv(trumpet, hSports);

% Question 2(b)
% Playing the resulting output sound
soundsc(trumpetSports, trumpetFs);

% Question 2(c)
x_trumpet = 0:len_trumpet - 1;
x_trumpetSports = 0:length(trumpetSports) - 1;

% Plotting the subgrids
% New figure
figure;

% The first subplot
subplot(2,1,1);
plot(x_trumpet, trumpet);
title('Anechoic Trumpet Signal');
xlabel('time (samples)');
ylabel('x[n] (Input Audio Signal)');
xlim([0 2101423]);

% The second subplot
subplot(2,1,2);
plot(x_trumpetSports, trumpetSports);
title('Trumpet Sounding As Though Played In A Sports Centre');
xlabel('time (samples)');
ylabel('y[n] (Convoluted Audio Signal)');
xlim([0 2101423]);

% Question 3
[hCave, hCaveFs] = audioread('cavemono.wav');

% Question 3(a)
% Calling the built-in function
trumpetCave = conv(trumpet, hCave);

% Question 3(b)
% Playing the sound
soundsc(trumpetCave, trumpetFs);
x_trumpetCave = 0:length(trumpetCave) - 1;

% Question 3(c)
% Plotting the graph
% New figure
% The first subgrid
figure;
subplot(2,1,1);
plot(x_trumpet, trumpet);
xlabel('time (samples)');
ylabel('x[n] (input audio signal)');
title('Anechoic Trumpet Signal');
xlim([0 len_trumpet - 1]);

% The second subgrid
subplot(2,1,2);
plot(x_trumpetCave, trumpetCave);
xlabel('time (samples)');
ylabel('y[n] (Convoluted Audio Signal)');
title('Trumpet Sounding As Though Played In A Cave');
xlim([0 len_trumpet - 1]);


