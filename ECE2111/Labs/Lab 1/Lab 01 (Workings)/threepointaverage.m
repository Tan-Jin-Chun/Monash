% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01Section5
% The name of this function is threepointaverage
% The purpose of this function is to implement a delay system

function [y, ny] = threepointaverage(x, nx)
% gainsys: implements a three point average system
% [y, ny] = threepointaverage(x, nx)
% where x and nx are row vectors of the same length
% produces an output y after going through a three point average system

    % Unneccesary to check the length since the sumsys and delaysys will
    % check the function
    
    % Delay x by 1 to get x1
    [x1, nx1] = delaysys(1, x, nx);
    
    % Delay x by 1 to get x2
    [x2, nx2] = delaysys(1,x1,nx1);
    
    % Gain x, x1 and x2 by 1/3
    [u, ux] = gainsys(1/3,x,nx);
    [u1, ux1] = gainsys(1/3,x1,nx1);
    [u2, ux2] = gainsys(1/3,x2,nx2);
    
    % Adding the three signals together
    [w, wout] = sumsys(u, ux, u1, ux1);
    [y, ny] = sumsys(w, wout, u2, ux2);
    
    % There is of course a more efficient way to do this. I am just
    % following the block diagram given
    % Three Point Average
    y(1:2) = 0; 
end