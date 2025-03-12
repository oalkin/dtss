% Script: mexdt_8_14.m
N = 25;                            % Filter length
K = 100;                           % Number of equations
F = [0,0.1,0.15,0.275,0.325,0.5];  % Critical frequencies (normalized)
A = [1,1,0.5,0.5,0,0];             % Amplitude response at critical frequencies
weights1 = [1,1,1,1,1,1];          % Weight factors for design 1
weights2 = [1,1,1,1,10,10];        % Weight factors for design 2
h1 = ss_firls(N,F,A,K,weights1);
h2 = ss_firls(N,F,A,K,weights2);
Omg = [0:255]/256*pi;
H1 = freqz(h1,1,Omg);
H2 = freqz(h2,1,Omg);
plot(Omg,20*log10(abs(H1)),Omg,20*log10(abs(H2))); grid;