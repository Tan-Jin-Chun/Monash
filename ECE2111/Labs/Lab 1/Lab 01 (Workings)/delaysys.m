% Written by Tan Jin Chun
% Last Modified : 25/7/2021
% Lab01Section5Part3
% The name of this function is delaysys
% The purpose of this function is to implement a delay system

function [y, ny] = delaysys(N, x, nx)
% gainsys: implements delay system
% [y, ny] = gainsys(N, x, nx)
% where x and nx are row vectors of the same length, and N is a scalar,
% produces signal y obtained by delaying x by N and having the same time indices.

    if length(x) ~= length(nx)
        error("arguments 1 and 2 should have the same length");
    end

    if ~isscalar(N)
        error("argument 1 should be a scalar");
    end
    
    % Getting the delay of the signals
    ny = nx;
    
    % Preallocating for speed
    y = zeros(1,length(x));
    
    % Using a for loop to go through the vector
    for i = 1:length(x)
        if (i - N >0 && i - N <=length(x))
            % Delaying the signal by N times (shifting the signal by N)
            y(i) = x(i-N);
        end
    end
end