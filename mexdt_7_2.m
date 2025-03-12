% Script: mexdt_7_2.m
N = 40;        % Period of the signal
L = 5;         % See Example 3.5 in Chapter 3.
n = [0:N-1];   % Vector of sample indices
xPer = ss_dpulse(n,2*L+1);  % One period of the signal
x = ss_dper(xPer,n+L);      % Periodic extension evaluated for n=0,1,...,N-1
ck = fft(x)/N;              % See Eqn. (7.4)
k = [0:N-1];
stem(k,real(ck));           % Graph DTFS coefficients
title('c_k (L=5)');
xlabel('Index k');
ylabel('Amplitude');