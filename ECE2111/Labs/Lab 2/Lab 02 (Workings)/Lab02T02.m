% Written by Tan Jin Chun
% Last Modified: 11/8/2021
% Lab02T02

clear all;close all;clc

% Question 2(a)
% Initialising the variable
D = 8192 * 0.75;
alpha = 0.5;

% Calling the function
[h,nh] = echoIR(D, alpha);

% Question 2(b)
% Making a stem plot
stem(nh,h);
xlabel("n (time in samples)")
ylabel("h[n]")
title("Impulse Response of Echo System");

% Question 2(c)
% Loading handel
load handel;

% Sound
ny = 0:(length(y)-1);

% Question 2(d)
% Calling the myconv() function
[yecho, nyecho] = myconv(y, ny, h, nh);


% Checking the graph
% figure
% plot(nyecho, yecho);

% Question 2(e)
% Playing the sound
soundsc(yecho, Fs);
pause;

% Decrease D
D = 8192 * 0.1;
alpha = 0.5;

% Calling back the functions
[h, nh] = echoIR(D,alpha);
[yecho, nyecho] = myconv(y, ny, h, nh);
soundsc(yecho, Fs);
pause;

% Decrease alpha
D = 8192 * 0.75;
alpha = 0.1;

% Calling back the function
[h, nh] = echoIR(D,alpha);
[yecho, nyecho] = myconv(y, ny, h, nh);
soundsc(yecho, Fs);
pause;

% Question 2(f)
D = 8192 * 0.75;
alpha = 0.5;

% Calling back the function and passing the yecho back into the function
[h, nh] = echoIR(D,alpha);
[yecho, nyecho] = myconv(y, ny, h, nh);
[yecho2, nyecho2] = myconv(yecho, nyecho, h, nh);
soundsc(yecho2, Fs);


