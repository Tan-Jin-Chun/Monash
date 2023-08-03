%%
close all; clear all;clc;
load ('assignment_data.mat');
Fs = 120; % in Hz
t = C1(:,1);
left = C1(:,2);
right = C1(:,3);
%%

begin_time = 0*Fs+1;
number_of_seconds = 30;
indexes = begin_time:begin_time+number_of_seconds*Fs;
time_30_sec = t(indexes);
left_30_sec = left(indexes);
right_30_sec = right(indexes);

windowLength = [10, 20, 50];

for i = 1:length(windowLength)
    figure(i);
    spectrogram(left_30_sec, windowLength(i),0, Fs, Fs,'yaxis');
    hold on;
    [s, w, t, ps] = spectrogram(left_30_sec, windowLength(i),0, Fs, Fs,'yaxis');
    sum_of_power_density = sum(ps);
    phase_threshold = (max(sum_of_power_density) - min(sum_of_power_density))/2;
    stance_time =  t(sum_of_power_density > phase_threshold);
    swing_time =  t(sum_of_power_density < phase_threshold);
    plot(stance_time, 5, 'bo', 'MarkerSize',2,'LineWidth',1);
    plot(swing_time, 2, 'kd', 'MarkerSize',2,'LineWidth',1);
    colormap jet;
    str = sprintf('Left VGRF signal of window length %d', windowLength(i));
    title(str);
    legend('stance phase', 'swing phase');
    hold off;
end

%% Answer to the question
% 1.
% The spectrogram becomes blur as the window length increases;
% this is due to the fact that the number of samples (time period) used for
% fourier transformation increases, and the frequency content is an
% aggreagate of each sub-phases of the stance and swing phase, the resolution 
% decreases. There is a better visualization when the window length
% decreases.

% 2.
% The main noise components could be observed at the window length of 50, where
% the power of the noise around 50Hz is strong.
% The main source of the noise signal could be power-line signal.