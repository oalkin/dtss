% Script: mexdt_1_10c.m
fs = 44100;      % Sampling rate
Ts = 1/fs;       % Sampling interval
n = [0:fs/2-1];  % Sample indices (for 1/2 second of audio)
% Set corner points for the modulating envelope
tq = [0,0.05,0.15,0.4,0.45,0.5];  
xq = [0,1.5,0.9,0.9,0,0];
% Obtain the modulating envelope q(n) through interpolation/sampling
q = interp1(tq,xq,n*Ts,'linear'); 
% Compute signals for each note
C4 = tone(261.63,fs,q,n);
D4 = tone(293.66,fs,q,n);
E4 = tone(329.63,fs,q,n);
F4 = tone(349.23,fs,q,n);
G4 = tone(392.00,fs,q,n);
A4 = tone(440.00,fs,q,n);
B4 = tone(493.88,fs,q,n);
C5 = tone(523.25,fs,q,n);
% Play the sound
sound([C4,D4,E4,F4,G4,A4,B4,C5],fs);

function x = tone(f,fs,q,n)
  F = f/fs;   % Normalized frequency
  x = 0.6*sin(2*pi*F*n).*q;
end