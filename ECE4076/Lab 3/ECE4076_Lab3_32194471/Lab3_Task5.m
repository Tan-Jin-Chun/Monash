% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task5

clear all;clc;close all;

% Declaring and initialising the variables
means = [-1, 0, 0.5, 2];
stds = [1.0, 2.0, 3.0, 1.0];
weights = [0.6, 0.1, 0.1, 0.2];

% Define the points for x using linspace
x = linspace(-10, 10, 1000);

% Calculate the GMM PDF using the function gmm_pdf
pdf = gmm_pdf(x, weights, means, stds);

% Samples from the GMM
samples = randsample(x, 1000, true, pdf/sum(pdf));

%% Flat Kernel - Mean Shift

% Mean shift starting from m=5
m_init = 5;
m_final = mean_shift(samples, m_init);
fprintf('Starting from m=%d, the mode of the distribution is approximately %f.\n', m_init, m_final);

% Plot the results
figure(1);
histogram(samples, 30, 'FaceAlpha', 0.5, 'Normalization', 'pdf');
hold on;
xline(m_init, '--r', 'Initial m');
xline(m_final, '-b', 'Final m');
legend('Samples', 'Initial m', 'Final m');
hold off;

% Mean shift starting from m=-5
m_init = -5;
m_final = mean_shift(samples, m_init);
fprintf('Starting from m=%d, the mode of the distribution is approximately %f.\n', m_init, m_final);

% Plot the results
figure(2);
histogram(samples, 30, 'FaceAlpha', 0.5, 'Normalization', 'pdf');
hold on;
xline(m_init, '--r', 'Initial m');
xline(m_final, '-b', 'Final m');
legend('Samples', 'Initial m', 'Final m');
hold off;

%% Epanechnikov Kernel - Mean Shift

% Define the x range
x_range = linspace(-10, 10, 1000);
bandwidth = 0.1;

% Mean shift starting from m=5
m_init = 5;
m_final = mean_shift_epanechnikov(samples, m_init, bandwidth);
fprintf('Starting from m=%d, the mode of the distribution is approximately %f.\n', m_init, m_final);
figure(3);
plot(x_range, normpdf(x_range, m_final, bandwidth), 'r-', 'DisplayName', sprintf('PDF from m=%d', m_init));
hold on;
xline(m_init, '--r', sprintf('Initial m=%d', m_init));
xline(m_final, '-r', sprintf('Final m=%d', m_init));

% Add legend and labels
legend;
title('Mean Shift Convergence with Epanechnikov Kernel');
xlabel('x');
ylabel('Probability Density');
hold off;

% Mean shift starting from m=-5
m_init = -5;
m_final = mean_shift_epanechnikov(samples, m_init, bandwidth);
fprintf('Starting from m=%d, the mode of the distribution is approximately %f.\n', m_init, m_final);
figure(4);
plot(x_range, normpdf(x_range, m_final, bandwidth), 'b-', 'DisplayName', sprintf('PDF from m=%d', m_init));
hold on;
xline(m_init, '--b', sprintf('Initial m=%d', m_init));
xline(m_final, '-b', sprintf('Final m=%d', m_init));

% Add legend and labels
legend;
title('Mean Shift Convergence with Epanechnikov Kernel');
xlabel('x');
ylabel('Probability Density');
hold off;

