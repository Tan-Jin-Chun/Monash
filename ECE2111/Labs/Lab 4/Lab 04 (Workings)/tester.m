%% Part 5
 
% Question 1
% bandstop 49 - 51 and 19 order
% high pass 1 Hz and 499 order
% low pass 40 Hz and 199 order
fig_num = 1;
Fs = 256;
L = [20, 500, 200];
order = L - 1;
 
notch = [49, 51]*2/Fs;
f = [0, notch , 1];
a = [1 0 0 1];
h = firpm(order(1), f, a); 
cv = conv(ECG, h);
 
cutoffHz = [0.4, 1];
cutoff = cutoffHz*2/Fs;
f = [0, cutoff, 1];
a = [0, 0, 1, 1];
h = firpm(order(2), f, a); 
cv = conv(cv, h);
 
cutoffHz = [40, 42];
cutoff = cutoffHz*2/Fs;
f = [0, cutoff, 1];
a = [1, 1, 0, 0];
h = firpm(order(3), f, a);
cv = conv(cv, h);
 
t = 3:1/Fs:6-1/Fs;
figure(fig_num);
plot(t, ECG(t(1)*Fs+1:(t(1)*Fs+length(t))), t, cv(t(1)*Fs+1:(t(1)*Fs+length(t))))
title('original and series filtered signal');
xlabel('time (in seconds)');
ylabel('signal');
legend('ECG', 'series system');
fig_num = fig_num + 1;
 
 
x = ECG;
N = length(x);
X = fft(x);
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);
fftx = fftshift(abs(X));
N0 = length(cv);
x0 = cv;
X0 = fft(x0);
omega0 = (-floor(N0/2):(N0-1-floor(N0/2)))*(Fs/N0);
 
figure(fig_num);
plot(omega, fftx, omega0, fftshift(abs(X0)));
title('coefficients');
ylabel('magnitude');
xlabel('frequency in Hz');
legend('original ECG', 'series system');
fig_num = fig_num + 1;
 
% Question 2 and 3
threshold = 0.6;
[pks,locs] = findpeaks(cv, 'MinPeakHeight',threshold);
 
% Question 4
plot_loc_max = t(end)*Fs;
plot_loc_min = t(1)*Fs;
plot_loc = locs(locs <= plot_loc_max & locs >= plot_loc_min);
plot_pks = pks(locs <= plot_loc_max & locs >= plot_loc_min);
 
figure(fig_num);
hold on;
plot(t, cv(t(1)*Fs+1:(t(1)*Fs+length(t))));
plot(plot_loc/Fs,plot_pks,'x','MarkerSize',15);
hold off;
legend('filtered ECG signal', 'peaks','Location', 'se');
xlabel('time in seconds');
ylabel('signal');
title('Filtered ECG signal');
%%
% Question 5
heartbeat_samples_interval = diff(locs);
heartbeat_seconds_interval = diff(locs./Fs);
 
% Question 6
% BPM is calculated using 60/rr-interval
BPM_seconds_interval = 60./heartbeat_seconds_interval;
BPM_seconds = mean(BPM_seconds_interval);
fprintf("The average heartbeat per minute (BPM) is %.2f\n", BPM_seconds);
%% Part 5
 
% Question 1
% bandstop 49 - 51 and 19 order
% high pass 1 Hz and 499 order
% low pass 40 Hz and 199 order
Fs = 256;
L = [20, 500, 200];
order = L - 1;
 
notch = [49, 51]*2/Fs;
f = [0, notch , 1];
a = [1 0 0 1];
h = firpm(order(1), f, a); 
cv = conv(ECG, h);
 
cutoffHz = [0.4, 1];
cutoff = cutoffHz*2/Fs;
f = [0, cutoff, 1];
a = [0, 0, 1, 1];
h = firpm(order(2), f, a); 
cv = conv(cv, h);
 
cutoffHz = [40, 42];
cutoff = cutoffHz*2/Fs;
f = [0, cutoff, 1];
a = [1, 1, 0, 0];
h = firpm(order(3), f, a);
cv = conv(cv, h);
 
t = 3:1/Fs:6-1/Fs;
figure(fig_num);
plot(t, ECG(t(1)*Fs+1:(t(1)*Fs+length(t))), t, cv(t(1)*Fs+1:(t(1)*Fs+length(t))))
title('original and series filtered signal');
xlabel('time (in seconds)');
ylabel('signal');
legend('ECG', 'series system');
fig_num = fig_num + 1;
 
 
x = ECG;
N = length(x);
X = fft(x);
omega = (-floor(N/2):(N-1-floor(N/2)))*(Fs/N);
fftx = fftshift(abs(X));
N0 = length(cv);
x0 = cv;
X0 = fft(x0);
omega0 = (-floor(N0/2):(N0-1-floor(N0/2)))*(Fs/N0);
 
figure(fig_num);
plot(omega, fftx, omega0, fftshift(abs(X0)));
title('coefficients');
ylabel('magnitude');
xlabel('frequency in Hz');
legend('original ECG', 'series system');
fig_num = fig_num + 1;
 
% Question 2 and 3
threshold = 0.6;
[pks,locs] = findpeaks(cv, 'MinPeakHeight',threshold);
 
% Question 4
plot_loc_max = t(end)*Fs;
plot_loc_min = t(1)*Fs;
plot_loc = locs(locs <= plot_loc_max & locs >= plot_loc_min);
plot_pks = pks(locs <= plot_loc_max & locs >= plot_loc_min);
 
figure(fig_num);
hold on;
plot(t, cv(t(1)*Fs+1:(t(1)*Fs+length(t))));
plot(plot_loc/Fs,plot_pks,'x','MarkerSize',15);
hold off;
legend('filtered ECG signal', 'peaks','Location', 'se');
xlabel('time in seconds');
ylabel('signal');
title('Filtered ECG signal');
%%
% Question 5
heartbeat_samples_interval = diff(locs);
heartbeat_seconds_interval = diff(locs./Fs);
 
% Question 6
% BPM is calculated using 60/rr-interval
BPM_seconds_interval = 60./heartbeat_seconds_interval;
BPM_seconds = mean(BPM_seconds_interval);
fprintf("The average heartbeat per minute (BPM) is %.2f\n", BPM_seconds);
