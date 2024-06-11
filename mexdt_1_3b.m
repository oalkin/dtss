% Script: mexdt_1_3b.m
n = [-5:10];         % Vector of sample index values
x = ss_dimpulse(n);  % Compute impulse signal amplitudes
stem(n,x);           % Graph the result