% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02
% The name of this function is echoIR()
% The purpose of this function is to create an impulse response with the
% inputted value of D (in samples) and alpha
% Input: D and alpha
% Output: h (impulse response signal) and nh (time indices)

function [h,nh] = echoIR(D, alpha)
    
    % Checking the inputted values into the function
    if isscalar(alpha) == 0
        error("The argument must be a scalar")
    end
    
    % Checking if the value of alpha is between 0 and 1
    if (alpha < 0 || alpha > 1)
        error("The value of alpha must be in between 0 and 1")
    end
    
    % Method 1
    % Calling the dtimpulse response function
    % d = dtimpulse(0,0,D);
    % ad = dtimpulse(D, 0, D);
    % h = d + alpha* ad;
    % nh = 1:length(h);

    % Method 2
    % Creating a vector 
    nh = 0:1:D+100;
    h = (nh == 0).*1 + (nh == D).*alpha;
    
end