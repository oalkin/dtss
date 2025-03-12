% Script: exdt_3_5.m
% Compute DTFS spectrum for N=40 and L=3 (edit to try other combinations)
N = 40;
L = 3;
Omega0 = 2*pi/N;   % Vector of angular frequencies
k = [0:N-1];       % Coefficient indices
% Compute DTFS coefficients
% Use 'eps' to avoid division by zero
c = sin(Omega0/2*(k+eps)*(2*L+1))./sin(Omega0/2*(k+eps))/N;
% Compute the envelope (by allowing non-integer values of the index)
k2 = [-0.5:0.01:N-1+0.5];
% Compute the envelope
env = sin(Omega0/2*(k2+eps)*(2*L+1))./sin(Omega0/2*(k2+eps))/N;
plot(k2,env,'b--');
hold on;
stem(k,c);
hold off;
xlabel('DTFS index  k');
title('DTFS coefficients and outline (envelope)');