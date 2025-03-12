% Script: mexdt_5_7b.m
Omega = [-1:0.004:1]*pi;   % Vector of angular frequencies
z = exp(j*Omega);          % Vector of z values
B = z+0.6;                 % Numerator
A = z-0.8;                 % Denominator
mag = abs(B)./abs(A);      % Magnitude response
phs = angle(B)-angle(A);   % Phase response
% Graph the magnitude and the phase of the system function
tiledlayout(2,1);
nexttile;
plot(Omega,mag); grid;
title('Magnitude of the frequency response');
xlabel('\Omega (rad)');
nexttile;
plot(Omega,phs); grid;
title('Phase of the frequency response');
xlabel('\Omega (rad)');