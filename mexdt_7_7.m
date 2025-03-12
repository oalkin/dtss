% Script: mexdt_7_7.m
g = [11,-2,7,9];
h = [6,14,-13,8];
x = g+j*h;         % Construct complex signal
Xk = fft(x);       % Compute DFT
% Compute the two components of the DFT
XE = 0.5*(Xk+conj(ss_crev(Xk)));  % Eqn. (7.54)
XO = 0.5*(Xk-conj(ss_crev(Xk)));  % Eqn. (7.55)
% Extract DFT's of the two signals
Gk = XE;           % See Example 7.11
Hk = -j*XO;        % See Example 7.11
disp(ifft(Gk))     % Should be the same as vector 'g'
disp(ifft(Hk))     % Should be the same as vector 'h'