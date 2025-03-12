% Script: mexdt_7_8c.m
x = [1,3,2,-4,6];   % Signal x[n]
h = [5,4,3,2,1];    % Signal h[n]
Xpk = fft(x,9);     % 9-point DFT of x[n]
Hpk = fft(h,9);     % 9-point DFT of h[n]
Ypk = Xpk.*Hpk;     % Eqn. (7.73)
yp = ifft(Ypk);     % Compute inverse DFT