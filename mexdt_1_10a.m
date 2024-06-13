% Script: mexdt_1_10a.m
f0 = 261.63;             % Audio frequency
fs = 44100;              % Sampling rate
F0 = f0/fs;              % Normalized frequency
n = [0:22049];           % Sample indices (for 1/2 second of audio)
x = 0.6*sin(2*pi*F0*n);  % Eqn. (1.70)
sound(x,fs);             % Play the sound