% Written by Tan Jin Chun
% Last Modified : 11/8/2021
% Lab02T05

clear all;close all;clc

% Question 1
% Loading echart
load echart;

h = [-1 1];
h_transpose = h';

% Question 1(a)
Yrow = conv2(1, h, echart);

% Question 1(b)
Ycol = conv2(h_transpose, 1, echart);

% Question 1(c)
Yboth = conv2(h_transpose, h, echart);

% Question 1(d)
% Displaying the image for Yrow
figure;
imshow(abs(Yrow), []);
title('Yrow');

% Displaying the image for Ycol
figure;
imshow(abs(Ycol), []);
title('Ycol');

% Displaying the image for Yboth
figure;
imshow(abs(Yboth), []);
title('Yboth');

% Question 2
% Getting echartnoisy
echartnoisy = echart + 0.8 * rand(size(echart));

% Question 2(a)
Zrow = conv2(1, h, echartnoisy);

% Question 2(b)
figure;
imshow(abs(Zrow), []);
title('Zrow');

% Question 3
% Question 3(a)
% Sampling Gaussian Function

% Creating one anonymous function
% Based on the equation from the lab notes
gauss_filter = @(n,sigma) (1./(sqrt(2*pi) * sigma)) .* (exp((-n.^2)./(2*sigma.^2)));

% Blurring Filters
n1 = -3:1:3;
n2 = -6:1:6;
n3 = -9:1:9;

% Creating signals h1,h2 and h3
h1 = gauss_filter(n1,1);
h2 = gauss_filter(n2,2);
h3 = gauss_filter(n3,3);

% Question 3(b)
figure;

% First subplot
subplot(3,1,1);
stem(n1, h1);
xlabel('n (time samples)');
ylabel('h_1[n]');
title("Impulse Response of Blur with Sigma = 1");

% Second subplot
subplot(3,1,2);
stem(n2, h2);
xlabel('n (time samples)');
ylabel('h_2[n]');
title("Impulse Response of Blur with Sigma = 2");

% Third subplot
subplot(3,1,3);
stem(n3, h3);
xlabel('n (time samples)');
ylabel('h_3[n]');
title("Impulse Response of Blur with Sigma = 3");

% Question 3(c)
Zblur1 = conv2(h1', h1, echartnoisy);
Zblur2 = conv2(h2', h2, echartnoisy);
Zblur3 = conv2(h3', h3, echartnoisy);

% First Image
figure;
imshow(Zblur1,[]);
title('Zblur1');

% Second Image
figure;
imshow(Zblur2,[]);
title('Zblur2');

% Third Image
figure;
imshow(Zblur3,[]);
title('Zblur3');

% Question 3(d)
Zblur1 = conv2(1, h, Zblur1);
Zblur2 = conv2(1, h, Zblur2);
Zblur3 = conv2(1, h, Zblur3);

% First Image
figure;
imshow(abs(Zblur1),[]);
title('Zblur1 after h filter');

% Second Image
figure;
imshow(abs(Zblur2),[]);
title('Zblur2 after h filter');

% Third Image
figure;
imshow(abs(Zblur3),[]);
title('Zblur3 after h filter');



