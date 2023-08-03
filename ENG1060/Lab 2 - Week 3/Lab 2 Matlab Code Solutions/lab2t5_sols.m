% Written Tony Vo
clear all; close all; clc;

% defining a set of widths
w = 7:0.01:20;
% Area given
A = 111;

% Using trigonometry and arranging equation from Area, length can be found
length = (A - (0.25*(w.^2)*tand(45)))./w;

% The perimeter can then be found from the set of W and corresponding L
perimeter = (w/cosd(45))+ (2*length) + w;

% Minimum perimeter and ID where it occurs
[min_perimeter, ID] = min(perimeter)

% corresponding L and W
shortest_width = w(ID)
shortest_length = length(ID)

plot(w,perimeter,'k-')
xlabel('width')
ylabel('permiter')
hold on
plot(shortest_width, min_perimeter,'bd')
