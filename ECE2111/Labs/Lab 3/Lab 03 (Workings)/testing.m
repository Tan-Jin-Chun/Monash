
%% Part 3
% Q1
[y,Fst] = audioread('trumpet.wav');
%%
% Q2
% Number of samples in 30ms
% 1000ms (1s) to 96000 samples
% 30 ms is equivalent to 96000*30/1000 = 2880 samples
M = Fst*30/1000
P = length(y)/M
% Q3
% each column corresponds to 30ms interval
yseg = reshape(y, M, P);
% Q4
N_y = length(y);
[ry, cy] = size(yseg)
y_k = zeros(size(yseg));
Yseg = zeros(size(yseg));
for i = 1:cy
% y_k(:,i) = 1/M*fft(yseg(:,i));
% Yseg(:, i) = fftshift(abs(y_k(:, i)));
Yseg(:,i) = 1/M*fft(yseg(:,i));
end
% y_k = 1/N_y*fft(y);
% y_time_samples = -floor(N_y/2):(N_y-1-floor(N_y/2));
% y_fft_shifted_samples = fftshift(abs(y_k));
% Yseg = reshape(y_fft_shifted_samples, M, P);
% figure(15);
% plot(y_time_samples, reshape(Yseg,1,M*P));
%%
% Q5
maxval = max(max(abs(Yseg)));
% Q6
threshold = 0.01;
Ysegtrunc = Yseg.*(abs(Yseg) > threshold*maxval);
% Yseg is a M-by-P matrix, it undergoes elementwise multiplication
% with the right term in the bracket
% abs(Yseg) takes the absolute value of each entry in the matrix Yseg
% if the element in Yseg(row, column) is greater than threshold*maxval
% then in the logical matrix, entry (row, column) is 1, otherwise, 0.
% When Yseg undergoes elementwise multiplication with the M-by-P logical
% matrix consisting 0s and 1s, the element multiply with 0 will not be kept
% only those multiplying with 1 will be kept
%%
% Q7
Ysegtrunc = sparse(Ysegtrunc);
whos y
whos Ysegtrunc
% Q8
% (a)
Ysegtrunc = full(Ysegtrunc);
y_converted_back = zeros(size(Ysegtrunc));
for i = 1:cy
y_converted_back(:,i) = ifft(M*Ysegtrunc(:,i));
end
% (b)
ytrunc = reshape(y_converted_back, 1, M*P);
%%
% (c)
soundsc(y, Fst);
pause(13);
soundsc(ytrunc, Fst);
%%
% (d)
interval = 99.5*M:101.5*M;
figure(14);
plot(interval, transpose(y(interval)));
hold on;
plot(interval, ytrunc(interval));
hold off;
title('signal and compressed signal over an interval');
xlabel('n (time samples)');
ylabel('signal strength');
diff = ytrunc - transpose(y);
figure(15);
plot(0:length(y)-1, diff);
title('difference of signal and compressed signal over an interval');
xlabel('n (time samples)');
ylabel('error');