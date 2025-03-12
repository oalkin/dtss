% Script: exdt_1_15.m
a = 0.94;
Omega = 0.15*pi;
n = 0:99;  % Vector of index values
x = (a.^n).*cos(Omega*n);  % Compute the signal x[n], n=0,...,99
stem(n,x);
% Compute signal energy using Eqn. (1.49)
Ex = 0.5/(1-a^2)+0.5*(1-a^2*cos(2*Omega))/(1+a^4-2*a^2*cos(2*Omega))
% Estimate the signal energy using 100 samples of the signal
Ex_est = sum(x.*x)