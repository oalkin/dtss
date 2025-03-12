% Script: exdt_7_7.m
k = [0:4];
n = [0:4];
xn = [1;-3;2;5;-6];   % Signal x[n] as a column vector
exponents = k'*n;     % Get a 5 by 5 matrix of exponents
W = exp(-j*2*pi/5);
A = W.^exponents      % Compute the coefficient matrix
Xk = A*xn             % Compute the DFT