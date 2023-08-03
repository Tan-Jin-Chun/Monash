% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task4

clear all;clc;close all;

% Declaring and initialising the variables
means = [-1, 0, 0.5, 2];
stds = [1.0, 2.0, 3.0, 1.0];
weights = [0.6, 0.1, 0.1, 0.2];

% Define the points for x using linspace
x = linspace(-10, 10, 1000);

% Calculate the GMM PDF using the function gmm_pdf
pdf = gmm_pdf(x, weights, means, stds);

% Plot the PDF
figure(1);
plot(x, pdf);
xlabel('x');
ylabel('Probability Density');
title('PDF of a Gaussian Mixture Model');



