% Written by ENG1060 team
% Modified by Tony Vo
clc; clear; close all;

%% vector
% x=4
x = [1 5 25 60]';

n = 0:5;
tanh_approx = (exp_taylor(x,n) - exp_taylor(-x,n))./(exp_taylor(x,n) + exp_taylor(-x,n));
tanh_real = tanh(x);
error = abs(tanh_approx - tanh_real);
fprintf("x: %.2f, Approximated tanh: %.2f, MATLAB's tanh: %.2f, Absolute error: %.2f\n", ...
    [x, tanh_approx, tanh_real, error]')