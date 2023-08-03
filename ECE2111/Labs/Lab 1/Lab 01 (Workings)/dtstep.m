% Written by Tan Jin Chun
% Last Modified : 25/7/2021
% Lab01T02
% The name of this function is dtstep
% The purpose of this function is to return a representation of the signal
% x[n] = delta[n-n_o] for the time n1<=n<=n2

% Only need to change one line of the given code (dtimpulse.m)

function [x,n] = dtstep(n0,n1,n2)
    % dtstep: returns discrete-time unit step function
    % centered at n0 over time range n1:n2
    % [x, n] = dtstep(n0,n1,n2)
    % where n0 n1 and n2 are integers with n1 <= n0 <= n2,
    % produces signal x[n] = u[n-n0] for n1<=n<=n2.
    n = n1:n2;
    x = zeros(1,length(n));
    
    % Just change this line from dtimpulse function file 
    % Explanation: Based on the lecture notes, the discrete time unit step
    % u[n] will have a value of one if n is bigger or equal to 0
    x(n>=n0) = 1;
    
end

