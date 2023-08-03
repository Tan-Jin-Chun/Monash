function I = comp_simp13_vector(x,y)
% I = comp_simp13_vector(x,y)
% Written By Tan Jin Chun , ID:32194471
% Last Modified : 4/1/2020
% MATLAB Assignment Question 2a
% Function file for Composite Simpson's 1/3 rule

% General purpose of the function file
% The purpose of the function file is to take two vectors, x (independent 
% variable) and y (dependent variable) to calculate the integral using the 
% Simpson's 1/3 rule.

% INPUTS:
%  - x: independent variable
%  - y: dependent variable

% OUTPUT:
%  - I: integral value

% Width and number of points
h = x(2)-x(1);
n = length(x);

% Error checking
if n < 3 || rem(n,2)==0
    error('Inapproprate number of points for Integration')
end

% Evaluating integral
% From the equation given in the assignment
even_sum = 4*sum(y(2:2:n-1));
odd_sum = 2*sum(y(3:2:n-2));
I = h/3*(y(1) + even_sum + odd_sum + y(end));
end
