% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01T04

clear all;clc;close all

% Part 1
% Initialising the variables
% 24577 samples are needed since 3*8192+1 = 24577
t = linspace(0,3,24577);
xs = cos(2*pi*440.*t);
fs = 8192;

% Playing the sound
sound(xs,fs);
pause

% Part 2
% The sound will have a lower pitch when played using a lower frequency
sound(xs,8000);
pause

% Part 3
% Creating a new signal with a factor of 2
ys = 2*xs;

% Playing the sound again
sound(ys,fs);
pause

% I hear a beep sound together with the original sound

% Playing the sound using soundsc()
soundsc(ys,fs);

% The data is scaled so that the sound is played as loud as possible with
% no clipping.

% Part 4
% Loading handel
load handel;

% Part 5
% Song is Hallelujah
y3 = y(1:length(t));
sound(y3,Fs);

% Part 6
% Plotting the continuous time signal
ty3 = linspace(0,3,length(y3));
plot(ty3,y3)
title("3 seconds of Handel, Hallelujah")
xlabel("t (time in seconds)")
ylabel("y_3(t)")
