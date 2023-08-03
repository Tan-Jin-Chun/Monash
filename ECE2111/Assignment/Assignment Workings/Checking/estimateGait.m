function [STl, STr, SWl, SWr, Sl, Sr] = estimateGait(VGRF)
% Input
% VGRF: the raw VGRF signals
% 
% Outputs
% STl vector of the stance times (durations of stance phases) for the left foot
% STr vector of the stance times for the right foot
% SWl vector of the swing times (durations of swing phases) for the left foot
% SWr vector of the swing times for the right foot
% Sl vector of the stride times (durations of stride phases) for the left foot
% Sr vector of the stride times for the right foot

Fs = 120; % in Hz
t = VGRF(:,1);
left = VGRF(:,2);
right = VGRF(:,3);

% Low pass filter
lowpass_cutoff = [10, 15];
f_lowpass = [0, lowpass_cutoff*2/Fs, 1];
a_lowpass = [1, 1, 0, 0];
L_lowpass = 150;
h_lowpass = firpm(L_lowpass, f_lowpass, a_lowpass); 

% high pass filter
% highpass_cutoff = [0.2, 0.7];
% f_highpass = [0, highpass_cutoff*2/Fs, 1];
% a_highpass = [0, 0, 1, 1];
% L_highpass = 200;
% h_highpass = firpm(L_highpass, f_highpass, a_highpass); 

cv_left = conv(left, h_lowpass);
cv_right = conv(right, h_lowpass);

threshold = 345;

left_swing_phase = 0;
left_stance_phase = 0;
left_stance_onset = zeros(1, length(cv_left));
left_swing_onset = zeros(1, length(cv_left));
% left_begin = floor((L_lowpass-1)/2 + length(h_lowpass) - 1);
left_begin = 180;

for i = left_begin:length(cv_left)
    
    if (cv_left(i) >= threshold && (~left_stance_phase))
        left_stance_phase = 1;
        left_swing_phase = 0;
        left_stance_onset(i) = 1;
    elseif (cv_left(i) < threshold && (~left_swing_phase))
        left_stance_phase = 0;
        left_swing_phase = 1;
        left_swing_onset(i) = 1;
    end
    
end

left_stance_begin_index = find(left_stance_onset);
left_swing_begin_index = find(left_swing_onset);
left_stance_begin_value = cv_left(left_stance_begin_index);
left_swing_begin_value = cv_left(left_swing_begin_index);
left_stance_duration = (left_swing_begin_index - left_stance_begin_index)/Fs;
left_swing_duration = (left_stance_begin_index(2:end) - left_swing_begin_index(1:end-1))/Fs;
left_stride_duration = (left_stance_begin_index(2:end) - left_stance_begin_index(1:end-1))/Fs;


right_swing_phase = 0;
right_stance_phase = 0;
right_stance_onset = zeros(1, length(cv_right));
right_swing_onset = zeros(1, length(cv_right));
% left_begin = floor((L_lowpass-1)/2 + length(h_lowpass) - 1);
right_begin = 180;

for i = right_begin:length(cv_right)
    
    if (cv_right(i) >= threshold && (~right_stance_phase))
        right_stance_phase = 1;
        right_swing_phase = 0;
        right_stance_onset(i) = 1;
    elseif (cv_right(i) < threshold && (~right_swing_phase))
        right_stance_phase = 0;
        right_swing_phase = 1;
        right_swing_onset(i) = 1;
    end
    
end

right_stance_begin_index = find(right_stance_onset);
right_swing_begin_index = find(right_swing_onset);
right_stance_begin_value = cv_right(right_stance_begin_index);
right_swing_begin_value = cv_right(right_swing_begin_index);
right_stance_duration = (right_swing_begin_index - right_stance_begin_index)/Fs;
right_swing_duration = (right_stance_begin_index(2:end) - right_swing_begin_index(1:end-1))/Fs;
right_stride_duration = (right_stance_begin_index(2:end) - right_stance_begin_index(1:end-1))/Fs;



begin_time = 10*Fs+1;
number_of_seconds = 5;
indexes = begin_time:begin_time+number_of_seconds*Fs;
time_5_sec = t(indexes);
% left_5_sec = left(indexes);
% right_5_sec = right(indexes);
leftc_5_sec = cv_left(indexes);
rightc_5_sec = cv_right(indexes);

left_plot_stance_index = left_stance_begin_index(left_stance_begin_index >= min(indexes) & left_stance_begin_index <= max(indexes))/Fs - 1/Fs;
left_plot_stance_value = left_stance_begin_value(left_stance_begin_index >= min(indexes) & left_stance_begin_index <= max(indexes));
left_plot_swing_index = left_swing_begin_index(left_swing_begin_index >= min(indexes) & left_swing_begin_index <= max(indexes))/Fs - 1/Fs;
left_plot_swing_value = left_swing_begin_value(left_swing_begin_index >= min(indexes) & left_swing_begin_index <= max(indexes));

right_plot_stance_index = right_stance_begin_index(right_stance_begin_index >= min(indexes) & right_stance_begin_index <= max(indexes))/Fs - 1/Fs;
right_plot_stance_value = right_stance_begin_value(right_stance_begin_index >= min(indexes) & right_stance_begin_index <= max(indexes));
right_plot_swing_index = right_swing_begin_index(right_swing_begin_index >= min(indexes) & right_swing_begin_index <= max(indexes))/Fs - 1/Fs;
right_plot_swing_value = right_swing_begin_value(right_swing_begin_index >= min(indexes) & right_swing_begin_index <= max(indexes));


figure(1);
plot(time_5_sec, leftc_5_sec, time_5_sec, rightc_5_sec);
hold on;
plot(left_plot_stance_index, left_plot_stance_value, 'bd', left_plot_swing_index, left_plot_swing_value ,'bo');
plot(right_plot_stance_index, right_plot_stance_value, 'rd', right_plot_swing_index, right_plot_swing_value, 'ro');
title('Filtered VGRF against time');
xlabel('time in seconds');
ylabel('VGRF in newtons'); 
legend('left foot', 'right foot', 'left stance onset', 'left swing onset', 'right stance onset', 'right swing onset');


N_left = length(cv_left);
X_left = fft(cv_left);
omega_left = (-floor(N_left/2):(N_left-1-floor(N_left/2)))*(Fs/N_left);

figure(2); 
plot(omega_left, fftshift(abs(X_left)));
title('Frequency domain plot of the left filtered VGRF signal');
ylabel('magnitude');
xlabel('frequency in Hz');

N_right = length(cv_right);
X_right = fft(cv_right);
omega_right = (-floor(N_right/2):(N_right-1-floor(N_right/2)))*(Fs/N_right);

figure(3); 
plot(omega_right, fftshift(abs(X_right)));
title('Frequency domain plot of the right filtered VGRF signal');
ylabel('magnitude');
xlabel('frequency in Hz');

figure(4);
left_stride_cycle = 1:length(left_stride_duration);
right_stride_cycle = 1:length(right_stride_duration);
plot(left_stride_cycle, left_stride_duration, right_stride_cycle, right_stride_duration);
title('stride vs cycle');
ylabel('time in seconds');
xlabel('cycles');
legend('left', 'right');

figure(5);
left_stance_cycle = 1:length(left_stance_duration);
right_stance_cycle = 1:length(right_stance_duration);
plot(left_stance_cycle, left_stance_duration, right_stance_cycle, right_stance_duration);
title('stance vs cycle');
ylabel('time in seconds');
xlabel('cycles');
legend('left', 'right');

figure(6);
left_swing_cycle = 1:length(left_swing_duration);
right_swing_cycle = 1:length(right_swing_duration);
plot(left_swing_cycle, left_swing_duration, right_swing_cycle, right_swing_duration);
title('swing vs cycle');
ylabel('time in seconds');
xlabel('cycles');
legend('left', 'right');

STl = left_stance_duration;
STr = right_stance_duration;
SWl = left_swing_duration;
SWr = right_swing_duration;
Sl = left_stride_duration;
Sr = right_stride_duration;

end

