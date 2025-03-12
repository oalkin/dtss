% Script: mexdt_7_8b.m
x = [1,3,2,-4,6];     % Signal x[n]
h = [5,4,3,2,1];      % Signal h[n]
xp = [x,zeros(1,4)];  % Extend by zero padding
hp = [h,zeros(1,4)];  % Extend by zero padding
Xpk = fft(xp);        % DFT of xp[n]
Hpk = fft(hp);        % DFT of hp[n]
Ypk = Xpk.*Hpk;       % Eqn. (7.73)
yp = ifft(Ypk);       % Compute inverse DFT