function I = comp_simp38_vector(x,y)
% I = comp_simp38_vector(x,y)
% Written by: Tan Jin Chun, ID: 32194471
% Last modified: 19/01/2021
% Matlab Assignment Question 2a
% Function file for Composite Simpson's 3/8 rule 

% General purpose of the Simpson's 3/8 rule 
% The purpose of this function file is to take two vectors, x (independent
% variable) and y (dependent variable) to calculate the integral using the 
% Composite Simpson's 3/8 rule

% INPUTS:
%  - x: independent variable
%  - y: dependent variable

% OUTPUT:
%  - I: integral value

% Creating x vector and determining width
h = x(2) - x(1);
n = length(x);

% Error checking
if n < 4 || rem(n-4,3)~= 0
    error('Inapproprate number of points for Integration')
end

% Evaluating integral
% From the equation of the assignment
sum_first = 3*sum(y(2:3:n-2));
sum_second = 3*sum(y(3:3:n-1));
sum_third = 2*sum(y(4:3:n-3));
I = 3*h/8 * (y(1) + sum_first + sum_second + sum_third + y(end));
end