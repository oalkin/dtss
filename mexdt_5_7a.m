% Script: mexdt_5_7a.m
Omega = 0.3*pi;           % Angular frequency
z = exp(j*Omega);         % Set complex variable z
B = z+0.6;                % Numerator value at Omega=0.3*pi
A = z-0.8;                % Denominator value at Omega=0.3*pi
mag = abs(B)/abs(A)       % Magnitude response
phs = angle(B)-angle(A)   % Phase response