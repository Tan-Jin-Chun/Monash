function [root, iter] = newraph(f, df, xi, precision)
% [root, iter] = newraph(f, df, xi, precision)
% Written by: Tan Jin Chun, ID: 32194471
% Last modified: 14/12/2020
% Matlab Assignment Q1d

% General purpose algorithm for Newton-Raphson Method
% This function takes a function hadle , the function handle of the
% derivative of the equation , the initial guess of the root and the
% precision required by the user and gives an output of the root of the
% equation and the number of iteration it took to achieve it.

% INPUTS:
%  - f: function handle of the equation to be solved
%  - df: function handle of the derivative of the equation to be solved
%  - xi: the initial guess / the next guess x_i_+_1
%  - precision: stopping criteria determined by the user

% OUTPUT:
%  - root: the root of the equation
%  - iter: total iteration taken

% Estimate 1st iteration of xi1(meaning xi+1) and initialise iteration count
iter = 1;
xi1 = xi-f(xi)/df(xi);


% Iteration for Newton-Raphson method starts
while abs(f(xi1)) > precision
    
    % Increment the iteration count by 1
    iter = iter + 1;
    
    % updating variables
    xi = xi1;
    
    % recalculating xi1
    xi1 = xi-f(xi)/df(xi);                    
end

% The final xi1 value is the root
root = xi1;
end