% Script: exdt_7_1.m
% Create a vector for the discrete-time pulse signal x[n]
x = [1,-1,2];
% Compute the DFT of the signal x[n]
Xk = fft(x)
% Obtain the pulse signal back from its DFT
ifft(Xk)