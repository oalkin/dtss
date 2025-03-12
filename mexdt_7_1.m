% Script: mexdt_7_1.m
n = [0:15];
xn = ss_dpulse(n,5);
Xk = ss_dft1(xn);
disp('Xk from ss_dft1()')
Xk
Xk = fft(xn);
disp('Xk from fft()')
Xk