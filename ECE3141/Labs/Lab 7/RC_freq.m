% Lab 7 ECE 3141 Matlab code to generate impulse and frequency responses
% of Raised cosine pulse shaping filters
% Gayathri Kongara, ECSE department, Monash University
% Written on 16/01/2017
% Revisions:11/02/2018

clear all;close all;clc


span = 6;              % Filter span indicates the effect of RC pulse in symbol periods
SampPerSymbol= 10;      %cut-off frequency equals (1/ SampPerSymbol)    
Sample_rate = 1/SampPerSymbol;

rolloff_vec = [0:0.2:1];
figure(2)
for rolloff_iter = 1:length(rolloff_vec)
rolloff =rolloff_vec(rolloff_iter);                     % Rolloff factor 
filtCoeff = rcosdesign(rolloff,span,SampPerSymbol,'normal');
[Frequency_response,W]=freqz(filtCoeff,1,512);% % calculate magnitude response and the corresponding frequency vector
magFrequency_response_in_dB= 20*log10(abs(Frequency_response)/max(abs(Frequency_response))); % Normalize the magnitude response
plot((W/(2*pi*Sample_rate)),magFrequency_response_in_dB,'DisplayName','rolloff=','DisplayName',num2str(rolloff)) %Plot the normalized frequency response
hold on
end 
title('Frequency responses of RC filter with variable rolloffs') 
legend('show') % 
xlabel('Normalized Frequency')
ylabel('Magnitude (dB)')
grid on

figure(3)
for rolloff_iter = 1:length(rolloff_vec)
rolloff =rolloff_vec(rolloff_iter);                     % Rolloff factor
filtCoeff = rcosdesign(rolloff,span,SampPerSymbol);
plot(linspace(-(span/2),(span/2),span*SampPerSymbol+1),filtCoeff./max(filtCoeff),'DisplayName','rolloff=','DisplayName',num2str(rolloff))
hold on
end
grid on
title('Time responses of RC filter with variable rolloffs') 
legend('show') % 
xlabel('Normalized symbol period')
ylabel('Amplitude')