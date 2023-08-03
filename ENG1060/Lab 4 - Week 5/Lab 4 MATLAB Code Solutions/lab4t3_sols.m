% Written by: Tony Vo
clear all; close all; clc;

%% part A
% loading in the temperature data
T = importdata('temperatures.txt');   
days = 1:length(T);

%% part B
plot(days,T,'rd')
xlabel('Days')
ylabel('Temperature')
title('Measured temperatures against days');

%% part C
% Finding indices of valid values
valid_indices = (T <= 45) & (T >= 0); % Rule 1 and 2
valid_indices([5,13,34,40,42]) = 0;     % Rule 3

% valid temperatures
valid_temps = T(valid_indices);
valid_days = days(valid_indices);

%% part D
% Plotting valid temperatures
figure;
plot(valid_days, valid_temps, 'bo');
title('Valid measured temperatures against days');
xlabel('Days'); ylabel('Temperature');