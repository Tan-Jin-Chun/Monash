%written by: Tony Vo
clear all; close all; clc; 

A = [8 7 9 5 7; 9 6 0 5 5; 3 6 0 2 3; 4 6 0 8 9; 2 1 2 1 2]
B = [38; -10; 44; -7; 53]


p1=A'
p2=p1*B
p3=sort(p2,'descend')
p4=A^2
p5=A([3 4 5], [2 3 4 5])
p6=A([2 3 4], [1 2 3 4])
p7=abs(p5-p6)
p8=p7.^2