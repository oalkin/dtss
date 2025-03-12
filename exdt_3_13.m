% Script: exdt_3_13.m
Fc = 1/9;                % Normalized cutoff frequency
n = [-20:20];            % Vector of sample indices
% Compute the signal x[n]
x = 2*Fc*sinc(2*Fc*n);   % Eqn. (3.88)
% Graph the signal x[n]
stem(n,x); grid;
axis([-20.5,20.5,-0.1,0.3]);
xlabel('Sample index n'); 
ylabel('Amplitude');
title('x[n] (for F_{c}=1/9)');