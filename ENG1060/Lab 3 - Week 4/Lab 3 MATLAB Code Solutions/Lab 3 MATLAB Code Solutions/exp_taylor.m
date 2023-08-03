function ex_approx = exp_taylor(x,n)
% Taylor approximation of the exponential function up to 0 to n terms.
% x is a column vector
% n is a row vector
% ex_approx is a column vector
ex_approx = sum(x.^n./factorial(n),2);