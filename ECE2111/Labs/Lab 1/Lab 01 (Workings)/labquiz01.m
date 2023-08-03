% Written by Tan Jin Chun
% Last Modified : 25/7/2021

% scatter(real(1+sqrt(-1)),imag(1+sqrt(-1)))

% [x1, nx] = dtimpulse(1,-1,4);
% [x2, nx] = dtimpulse(2,-1,4);
% 
% stem(nx,x1-x2);
% title('Graph of x vs time');
% xlabel('n (time in samples)');
% ylabel('x[n]');

[x1,nx1] = dtimpulse(1,-1,4);
[x2,nx2] = dtimpulse(2,-1,4);
[z,nz] = sumsys(x1,nx1,x2,nx2);
[y,ny] = delaysys(1,z,nz);

stem(ny,y);