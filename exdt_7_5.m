% Script: exdt_7_5.m
% Create a vector for the discrete-time pulse signal x[n]
x = ones(1,10);
% Compute the DFT of the signal x[n] padded with 10 zeros
Xk = fft(x,20);   % Edit this line to experiment
% Graph the magnitude and the phase
tiledlayout(2,1);
nexttile;
stem([0:19],abs(Xk)); grid;
axis([-0.5,19.5,0,12]);
title('|Q[k]|');
nexttile;
stem([0:19],angle(Xk)); grid;
axis([-0.5,19.5,-pi,pi]);
title('\angle Q[k]');