% Written by: Soon Foo Chong
% computes cost of a tank with input r and V
clear all; close all; clc;

% Input Arguments
V = 500;%600;
r = 1:0.001:10;

[C,h] = cost_tank(r,V);

[minC, id] = min(C);
corresponding_r = r(id);
corresponding_h = h(id);

%plot
plot(r,C);
hold on;
plot(corresponding_r,minC,'rd');
text(corresponding_r,minC-0.1e5,'Minimum Cost');
xlabel('Radius,r');
ylabel('Cost,C');

% display output
% students may not have learned fprintf yet so unsuppressed output is fine
fprintf ('A radius of %3.4fm and height of %3.4fm gives the minimum cost of C=$%3.2f\n',corresponding_r,corresponding_h,minC);
