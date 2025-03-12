% Script: mexdt_8_3a.m
[x,fs] = audioread('GuitarA2.flac',[1,22050]);  % Load 1 second of audio
mag = abs(fftshift(fft(x)));     % Magnitude of the spectrum
nSamp = length(x);               % Number of samples
Fnorm = [0:nSamp-1]/nSamp-0.5;   % Normalized frequencies from -0.5 to 0.5
f = Fnorm*fs;                    % Actual frequencies from -fs/2 to fs/2
plot(f/1000,mag/fs); grid;       % Graph magnitude spectrum
axis([-11,11,0,0.015]);
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('|X_{a}(f)|')