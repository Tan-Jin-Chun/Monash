% Lab 7 ECE 3141 Matlab code to generate impulse and frequency responses
% of Rectangular pulse shaping filters
% Gayathri Kongara, ECSE department, Monash University
% Written on 16/01/2017
% Revisions:11/02/2018
% Revised: Mike Biggar 21/05/2020

clear all;close all;clc

SampPerSymbol= 10;             %Number of samples in each symbol period
Sample_rate = 1/SampPerSymbol; %Sample rate
filtCoeff = ones(1,SampPerSymbol);% 
[Frequency_repsonse,frequencies]=freqz(filtCoeff,1,1024);%  frequency response 
Frequency_repsonse_in_dB= 10*log10(abs(Frequency_repsonse)/max(abs(Frequency_repsonse))); % Normalize the magnitude response
TimeSamples=zeros(1,1024);
TimeSamples(1:SampPerSymbol)=filtCoeff(1:SampPerSymbol);

figure(1)                     % Time plot of rectangular pulse
plot(TimeSamples(1:1024));
ylim([0 1.2]);
xlabel('Time index');
ylabel('Value');

figure(2)
plot(((frequencies)/(2*pi*Sample_rate)),Frequency_repsonse_in_dB,'-') %Plot the normalised frequency response
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')
grid on


