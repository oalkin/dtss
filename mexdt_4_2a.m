% Script: mexdt_4_2a.m
t = [-5:0.01:5];
xa = @(t) exp(-abs(t));
fs = 2;
Ts = 1/fs;
n = [-15:15];
xn = xa(n*Ts);
tiledlayout(2,1);
nexttile;   % Graph analog signal
plot(t,xa(t)); grid;
title('Signal x_{a}(t)');
nexttile;   % Graph sampled signal
stem(n,xn);
title('Signal x[n]');