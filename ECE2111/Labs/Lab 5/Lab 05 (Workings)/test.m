% n = 1:10000;
% x1 = cos(100*pi/20000*n);
% x2 = cos(100*pi/2000*n);
% 
% soundsc(x1,20000);
% pause
% soundsc(x2,2000);


h = firpm(100,[0 0.18,0.20,1],[1 1 0 0]);
freqz(h,1)

