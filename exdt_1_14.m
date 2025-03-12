% Script: exdt_1_14.m
a = 0.92;
n = 0:99;  % Vector of index values
x = a.^n;  % Compute the signal x[n], n=0,...,99
stem(n,x);   
% Compute signal energy using Eqn. (1.48)
Ex = 1/(1-a^2)  
% Estimate the signal energy using 100 samples of the signal
Ex_est = sum(x.*x)