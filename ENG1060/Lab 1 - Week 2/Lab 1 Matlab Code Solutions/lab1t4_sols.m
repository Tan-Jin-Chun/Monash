% Written by: Tony Vo, Modified by: Soon Foo Chong
clear all; close all; clc

%calculate using vectors
x=-299:999;

f = x.*cos(x)./((x.^2+1).*(x+2));
product = f(121)*f(446)*f(end)
