% Written by Tony Vo
% computing the atmospheric pressure for given altitude
clear all; close all; clc;

% Input parameters
z = 0:0.025:12;
P = atmos_press(z);

% Plotting P against z
plot(z,P,'r--');
title ('Atmospheric pressure vs. altitude')
xlabel('Altitude (km)')
ylabel ('Pressure (kPa)')
grid on

%marking key locations
hold on
z_key = [1.74 1.7 0.66 4.441 5.334 1.95 11.337 8.848];
P_key = atmos_press(z_key);
plot(z_key,P_key,'bo')
legend('Atmos. pressure relationship','key locations')

%% optional - students don't know cells but can check text() documentation for examples
locations = {'Perisher Valley', 'Hotham heights', 'Canberra', 'Yamdrok Lake', ...
    'Lipulekh Pass', 'Jejudo', 'Mount Hyjal', 'Mount Everest'};
x_anchor = z_key + 0.2;
y_anchor = P_key + 1;
x_anchor(2) = z_key(2) - 1;
y_anchor(2) = P_key(2) + 5;
text(x_anchor,y_anchor,locations)
