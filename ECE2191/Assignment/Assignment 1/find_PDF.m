function [xval, yval] = find_PDF(x,y)
% Name: find_PDF
% Purpose: find the PDF of SDRR
% Input: x and y values (data and bin values)
% Output: a bar graph
% NOTE: Codes are from the lecture notes (Used only for Q5.5)

% Get the number of samples from the data
N = length(x);

% Defining x and y values
% Hist function should be avoided
[yval, xval] = hist(x, y);

% Normalizing the variable as to get the relative frequencies
yval = yval / N;

% Creating a new figure
figure;

% Plotting the bar graph
bar(xval,yval);
xlabel('SDRR');
ylabel("Relative Frequencies");
title("Probability of SDRR value In Each Bin");

end