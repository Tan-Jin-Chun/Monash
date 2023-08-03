% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02T01Part1

% The name of this function is myconv
% The purpose of this function is to take four row vectors x, nx (DT Signal x)
% , h and nh (DT signal h) and carry out the convolution for both of the
% signals provided.
% The inputs are x, nx, h and nh
% Tne outputs are y and ny

% Assumptions Made
% Assume that nx = ax:bx for integers ax and bx and that nh = ah:bh for
% integers ah and bh

function [y, ny] = myconv(x, nx, h, nh)

    % Adding the two vectors together
    ny = (min(nx) + min(nh)):(max(nx) + max(nh));
    
    % Using matlab built in conv() function
    y = conv(x, h);
    
end