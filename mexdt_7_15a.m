% Script: mexdt_7_15a.m
N = 32;                 % Number of samples in the signal x[n]
xn = randn(N,1);        % Generate a random signal
M = 5;                  % Number of transform samples requested
Omg0 = 0.5;             % Initial angular frequency
Delta = 2*pi/17;        % Angular frequency increment
k = [0:M-1];            % Indices of angular frequencies
Omg = Omg0 + k*Delta;   % Vector of angular frequencies
disp('Results obtained from DTFT')
ss_dtft(xn,Omg)
disp('Results obtained using CTA')
ss_cta(xn,Omg0,Delta,M)