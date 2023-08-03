% Written by Tan Jin Chun
% Last Modified: 25/7/2021
% Lab01T02

clc,clear,close all

% Question 2(a)
% Initialising the variable
n1 = -5;
n2 = 5;

% Centered at 0 , so n0 = 0, between -5 and 5
% Calling the function dtstep
[x,n] = dtstep(0,n1,n2);
x0 = exp(0.3.*n).*x;

% Plotting the graph
figure
stem(n,x0);
title("Graph of x_0 vs n (time in samples)");
xlabel("n (time in samples)");
ylabel("x_0[n]");

% Question 2(b)
% Initialising the variable
n1 = -5;
n2 = 5;

% Calling the function dtstep
% For delta[n+2]
% n -(-2)
[u0,n] = dtimpulse(-2,n1,n2);

% For delta[n-4]
% n-(4)
[u1,n] = dtimpulse(4,n1,n2);
x1 = u0-u1;

% Plotting the graph
figure
stem(n,x1);
title("Graph of x_1 vs n (time in samples)");
xlabel("n (time in samples)");
ylabel("x_1[n]");

% Question 2(c)
% Initialising the variable
n1 = 0;
n2 = 20;

% Calling the function dtstep
[u2,n] = dtstep(0,n1,n2);
[u3,n] = dtstep(10,n1,n2);
[u4,n] = dtstep(20,n1,n2);

% From the formula
x2 = n.*(u2-u3) + 10.*exp(-0.3.*(n-10)).*(u3 - u4);

% Plotting the graph
figure
stem(n,x2);
title("Graph of x_2 vs n (time in samples)");
xlabel("n (time in samples)");
ylabel("x_2[n]");

