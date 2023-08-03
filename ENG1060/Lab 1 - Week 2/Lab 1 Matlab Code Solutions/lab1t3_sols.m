% Written by: Soon Foo Chong
clear all; close all; clc

c=linspace(0.1,100,7);

req_s = 1/sum(1./c)
req_p = sum(c)

%May use fprintf instead which will be covered in upcoming workshop
fprintf('C (eq. series) = %.4f Farad\n',req_s)
fprintf('C (eq. parallel) = %.4f Farad\n',req_p)