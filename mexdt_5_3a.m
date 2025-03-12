% Script: mexdt_5_3a.m
num = [1,0,-0.5,0.5];          % Numerator
den = [1,-0.5,-0.5,-0.6,0.6];  % Denominator
zrs = roots(num);              % Zeros of the system function
pls = roots(den);              % Poles of the system function
Omega = [0:0.001:1]*2*pi;      % Vector of angular frequencies
c = exp(j*Omega);              % Unit circle
plot(real(zrs),imag(zrs),'bo',real(pls),imag(pls),'bx',real(c),imag(c),'r--');
axis equal;