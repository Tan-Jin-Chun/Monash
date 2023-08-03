% ECE 3141 Matlab code to generate eye digrams using Rectangular
% pulses for QAm modulation
% Copyright: Gayathri Kongara, ECSE department, Monash University
% Created on 16/01/2017
% Revisions: 28/01/2018
%            10/05/2022 (Yi Hong, Mike Biggar)
clear all
clc
close all
rng default
SNR = [0:1:10];         % SNR is defined as Energy per bit to noise power
% Changed to 20
%Modulation parameters
M = 16;                  %  Input Modulation alphabet size
% Changed M to 16 for Q5d
k = log2(M);              % Bits/symbol

%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRANSMITTER %%%%%%%%%%%%
FrmLen = 1000;       % frame length in number of bits

data =   randi([0 M-1],FrmLen,1);
SymbSet = 0:M-1;
const = qammod(SymbSet,M); 
Scale = modnorm(const,'avpow',1); % Scale factor to normalize the energy of the constellation
dataMod1 = qammod(data,M);
dataMod= Scale*dataMod1 ;
delay =  0;   % input('delay in number of samples' ); 
timeOffset = zeros(delay,1);
Samples_per_symbol = 10;  


FilterSpan = 14;                         % Filter FilterSpan
rolloff = 0.5;                           % Rolloff factor Matched filter used
FiltCoeff = rcosdesign(rolloff,FilterSpan,Samples_per_symbol);
txSig = upfirdn(dataMod,FiltCoeff,Samples_per_symbol,1); % Filter the modulated data
txSig = [timeOffset; txSig(1:end-delay)];


%% 
%%%%%%%%%%%%%% AWGN CHANNEL %%%%%%%%%%%%%%%%%%%%%%%%
for snr_iter = 1:length(SNR)
EbNo = SNR(snr_iter);
% Calculate the SNR for an oversampled QPSK signal.
snr = EbNo +10*log10(k)-10*log10(Samples_per_symbol); % calculate the SNR per sample

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RECEIVER %%%%%%%%%%%%%%%%%%%%%%%%
% Add AWGN
rxSig = awgn(txSig,snr,'measured');

rxSigFilt = upfirdn(rxSig, FiltCoeff,1,Samples_per_symbol);% Apply the RRC receive filter and downsample to symbol rate
rxSigFilt = rxSigFilt(FilterSpan+1:end-FilterSpan);
rxSigFilt_beforesample = upfirdn(rxSig, FiltCoeff);

dataOut = qamdemod((1/Scale)*rxSigFilt,M);
Errors = sum(dataOut ~= data); % calculate symbol errors
BER_simulation(snr_iter) = Errors/(FrmLen*k); % calculate BER
end
fprintf('SIMULATION SUMMARY \n' ) ;
fprintf('Simulation of BER results for an %d -QAM system \n', M ) ; 
fprintf('SNR equal to %d \n', SNR ) ; 
fprintf('BER equal to %d \n' , BER_simulation)



% %% Use this Section to plot Eyediagrams
% %EYEDIAGRAMS plotting commands 
% 
% txSig_useful= txSig(FilterSpan*Samples_per_symbol+1:end-FilterSpan*Samples_per_symbol);
% E1=eyediagram(txSig_useful,2*Samples_per_symbol) ;
% E1.Name = 'Eye diagram of transmit signal' ; % Name of the Eye diagram
% rxSig_useful= rxSig(FilterSpan*Samples_per_symbol+1:end-FilterSpan*Samples_per_symbol);
% E2=eyediagram(rxSig_useful,2*Samples_per_symbol) ;
% E2.Name = 'Eye diagram of Receive signal before Rx filter';   % Name of the Eye diagram
% 
% %% This extra plot added 2022
% rxSig_useful= rxSigFilt_beforesample(FilterSpan*Samples_per_symbol+1:end-FilterSpan*Samples_per_symbol);
% E3=eyediagram(rxSig_useful,2*Samples_per_symbol) ;
% E3.Name = 'Eye diagram of Receive signal after Rx filter';   % Name of the Eye diagram
% 
% %% USE this section of the code to generate scatterplots
% h1= scatterplot(sqrt(Samples_per_symbol)*txSig_useful,1,0);  
% hold on
% scatterplot(dataMod,1,0,'r*',h1) ;
% h1.Name ='scatterplot of the transmit pulse shaped signal';
% legend('After Pulse shaping','Transmit data','location','best')
% hold off
% h2= scatterplot(rxSigFilt,1,0); 
% hold on
% scatterplot(dataMod,1,0,'r*',h2) ;
% h2.Name= 'scatterplot of the noisy received signal';
% legend('Noisy received signal','Transmit data','location','best')
% % 
% % PLOTTING Commands for SNR versus BER  Theory
% %       SNR = [0:1:12];
% %       BER_theory = berawgn(SNR,'qam',4,'nondiff');
% %       semilogy(SNR,BER_theory,'-o','linewidth', 2)
% %       hold on 
% %       BER_theory = berawgn(SNR,'qam',16,'nondiff');
% %       semilogy(SNR,BER_theory,'-o','linewidth', 2)
% %       hold on 
% %       legend('BER theory M=4', 'BER theory M=16')
% %       grid on

% 
% 
% % PLOTTING Commands for SNR versus BER  simulations
% %     semilogy(SNR,BER_simulation,'--','linewidth', 2,'DisplayName',num2str(M))
% %     hold on
% %     legend('show')
     

%    BW efficiency of Sinc =log2(M)
%    BW efficiency of RC =log2(M)/(1+alpha)

eta_alpha1 = log2([4 16 64 256 512 1024])./(1+0.1);
eta_alpha2 = log2([4 16 64 256 512 1024])./(1+0.2);
eta_alpha3 = log2([4 16 64 256 512 1024])./(1+0.5);
eta_sinc = log2([4 16 64 256 512 1024]);
semilogx([4 16 64 256 512 1024],eta_alpha1,'b')
xlabel('M');
ylabel('efficiency')
hold on
semilogx([4 16 64 256 512 1024],eta_alpha2,'r')
semilogx([4 16 64 256 512 1024],eta_alpha3,'g')
semilogx([4 16 64 256 512 1024],eta_sinc,' k')
legend('\alpha=0.1','\alpha=0.2','\alpha=0.5','Sinc')


