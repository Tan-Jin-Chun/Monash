function [q] = dCdt(p)
% Name : Tan Jin Chun
% ID   : 32194471
% Date Modified : 15/01/2021

% The General Purpose of this function file is to take the coefficients of
% p which is the second order polynomial and obtain the coefficients of the
% derivative of the 2nd Order Polynomial obtained from the data

% Input
% p - the coefficients of the second order polynomial equation

% Output
% q - the coefficients for the derivative of the second order polynomial
% equation
q = [p(1)*2 p(2)];

% This is another way for getting the coefficients of the derivative of the
% second polynomial which is by using the polyder function
% q = polyder([p(1),p(2),p(3)]);

end
