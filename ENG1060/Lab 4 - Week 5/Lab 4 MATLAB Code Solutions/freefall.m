function [vt,yt] = freefall(m,k,n)
% [vt,y] = freefall_1(m,k,n) calculates the terminal velocity vt and
% the corresponding distance at which this occurs 
% inputs 
% m = mass
% k = drag parameter 
% n = fraction of terminal velocity (0-1)

g = 9.81; 
vt = sqrt(m*g/k);
yt = m/(2*k).*log(m*g./(m*g-k*(n*vt).^2));
