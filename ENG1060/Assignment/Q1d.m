% Q1d

% Some code may already be provided below
% DO NOT clear, close or clc inside this script
% Apply good programming practices
%
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 12/1/2021

fprintf('\n Q1d \n\n')

%% code starts here
%Initial Variable
xi = 300;
precision = 1e-5;
f = @(x) p5(1)*x^2 - abs(p5(2))*x + p5(3) -  12e4;

%Calling the function of q and using the coefficients in the anonymous function
%for the derivative
p = [p5(1) p5(2) p5(3)];
[q] = dCdt(p);

%Converting the output of the function file into an anonymous function
df = @(x) q(1)*x + q(2);

%Calling the function of newraph
[root, iter] = newraph(f, df, xi, precision);

%Printing the statement out
fprintf('The days tracked when the total cases of Malaysia reached 12x10^4 is %.f days\n',root);


