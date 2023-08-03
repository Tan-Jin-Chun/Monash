% Written by: Tony Vo
clear all; close all; clc

p0 = 20e-6;

%% part A
p_mosquito = 20e-6;
SPL_mosquito = log10(p_mosquito/p0)/0.05;
fprintf('SPL (mosquito) = %.4f dB\n',SPL_mosquito)

%% part B
p_jet = 11.25;
SPL_jet = log10(p_jet/p0)/0.05;
fprintf('SPL (jet) = %.4f dB\n',SPL_jet)


%% part C
p_karen = 20e3;
SPL_karen = log10(p_karen/p0)/0.05;
fprintf('SPL (Karen) = %.4f dB\n',SPL_karen)

