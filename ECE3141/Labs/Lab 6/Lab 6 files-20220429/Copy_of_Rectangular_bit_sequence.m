% Lab 6 ECE 3141 Matlab code to generate rectangular pulses and filter them
% to demonstrate effects of bandlimiting and ISI.

% Original: Mike Biggar, ECSE department, Monash University, April 2019
% Revised: Georgia Ovenden, May 2019

clear all
% Set up parameters

ArraySize=1024;                 % Time (and frequency) data array size
SampPerSymbol= 16;              % Number of samples in each symbol period. Minor artefacts will result if not an integer divisor of ArraySize
Norm_freq = 1/SampPerSymbol;    % Normalised frequency scaling factor
DisplayBits=20;                 % Number of bits to plot in time plots (bits and symbols both are used in comments, they are all the same)
FilterWidth=8;                  % Determines LPF cutoff (normalised frequency)
SNR = 5;                        % SNR for addition of AWGN (in dB) after filtering

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate binary sequence of time domain data
% Substitute this code to experiment with different patterns or to use
% fixed patterns
% (Below we generate a new bit sequence every time the code is run.)

NumInputBits = floor(ArraySize/SampPerSymbol)
BitPattern = 3;     % enter values 1 or 2 or 3
if BitPattern==1
    BitPattern=randi([0 1], 1, NumInputBits);       % Random 1s and 0s
    titleString =  "Random 1s and 0s";
elseif BitPattern==2
    BitPattern=mod(1:NumInputBits,2);               % Alternating 1s and 0s
    titleString =  "Alternating 1s and 0s";
elseif BitPattern==3
    BitPattern=zeros(1, NumInputBits);
    BitPattern(round(DisplayBits/2))=1;             % Single rectangular pulse
    titleString =  "Single Rectangular Pulse";
end

% Define each rectangular pulse with SampPerSymbol sample points;
for i = 1:NumInputBits
    TimeSample((i-1)*SampPerSymbol+1:(i-1)*SampPerSymbol+SampPerSymbol)=BitPattern(i);
end
% Plot first DisplayBits pulses before filtering
figure(1)
plot(TimeSample);
xlim([0 DisplayBits*SampPerSymbol]);
ylim([-0.2 1.2]);
xlabel('Time index')
ylabel('Magnitude')
title(strcat(titleString, ": Before filter"))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BrickWallCutOff = FilterWidth;                  % Units of normalised frequency
LPFcutoff = round(BrickWallCutOff*Norm_freq*1024);


% FFT and brick wall filter
[Frequency_response1]=fft(TimeSample,1024);     %  frequency response
Frequency_response_LPF=Frequency_response1;
Frequency_response_LPF(LPFcutoff+2:512)=0;      % Symmetrical filtering either side of zero frequency. Note that we have a two-sided
Frequency_response_LPF(513:1024-LPFcutoff)=0;   % frequency representation, so negative frequencies are at indices 513-1024
Frequency_response_LPF_shift = [Frequency_response_LPF(512+1:1024),Frequency_response_LPF(1:1024/2)]; % Shift zero frequency to centre of array (for mag display only)
Frequency_response_in_dB1= 20*log10(abs(Frequency_response_LPF_shift)/max(abs(Frequency_response_LPF_shift))); % Normalise the magnitude response
figure(2)
frequencies = 2*pi*(-511:512)/1024 ;
plot(((frequencies)/(2*pi*Norm_freq)),Frequency_response_in_dB1,'-') %Plot the normalised frequency response
xlim([-FilterWidth*1.5 FilterWidth*1.5]);
xlabel('Normalised Frequency')
ylabel('Magnitude (dB)')
title(strcat(titleString, ": Frequency Response"))
grid on

% % Inverse transform and plot
% [TD_function]=ifft(Frequency_response_LPF);
% figure(3)
% plot(TD_function);
% xlim([0 DisplayBits*SampPerSymbol]);
% ylim([-0.2 1.2]);
% xlabel('Time index')
% ylabel('Magnitude')
% title(strcat(titleString, ": After LPF"))

% % Add noise and plot
% Noisy_Received_Sig = awgn(TD_function, SNR);
% figure(4)
% plot(Noisy_Received_Sig);
% xlim([0 DisplayBits*SampPerSymbol]);
% ylim([-0.2 1.2]);
% xlabel('Time index')
% ylabel('Magnitude')
% title(strcat(titleString, ": Noise added"))


% % Filter a second time (after noise addition - at receiver)
% [Frequency_response1]=fft(Noisy_Received_Sig,1024);%  frequency response
% Frequency_response_LPF=Frequency_response1;
% Frequency_response_LPF(LPFcutoff+2:512)=0;      % Symmetrical filtering either side of zero frequency. Note that we have a two-sided
% Frequency_response_LPF(513:1024-LPFcutoff)=0;   % frequency representation, so negative frequencies are at indices 513-1024
% 
% % Inverse transform and plot
% [TD_function]=ifft(Frequency_response_LPF);
% figure(5)
% plot(TD_function);
% xlim([0 DisplayBits*SampPerSymbol]);
% ylim([-0.2 1.2]);
% xlabel('Time index')
% ylabel('Magnitude')
% title(strcat(titleString, ": Signal at receiver"))
% 
% % Detect received value - threshold applied at mid-point of each pulse period
% FirstSamplePoint = round(SampPerSymbol/2);
% for i=1:NumInputBits
%     if(TD_function(FirstSamplePoint+(i-1)*SampPerSymbol)>0.5)
%         DetectedBits(i)=1;
%     else
%         DetectedBits(i)=0;
%     end
% end
% 
% Erroredbit_array=mod(BitPattern+DetectedBits,2);    % Find bit errors
% NumErrors=sum(Erroredbit_array,2)                   % Count bit errors