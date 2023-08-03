% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01Section5Part1
% The name of this function is sumsys
% The purpose of this function is to implement a sum system (addition)

function [y, nout] = sumsys(x1, nin1, x2, nin2)
% gainsys: implements sum system
% [y, nout] = gainsys(x1,nin1,x2,nin2)
% where x1 and nin1 are row vectors of the same length and the same goes
% for x2 and nin2 
% produces signal y obtained by adding x1 by x2 
% This system only works for discrete time and does not work for continuous
% time

    if length(x1) ~= length(nin1)
        error("arguments 1 and 2 should have the same length");
    end
    
    if length(x2) ~= length(nin2)
        error("arguments 3 and 4 should have the same length");
    end
    
    % Preallocating for speed
    nout = 1:length(nin2);
    y = 1:length(nin2);
    
    % Using a for loop to loop through the vectors
    for i = 1:length(nin2)
        % Getting the sum of the signals
        nout(i) = nin1(i);
        y(i) = x1(i) + x2(i);
        
    end
   
end