% Script: mexdt_8_13.m
N = 25;                            % Filter length
F = [0,0.1,0.15,0.275,0.325,0.5];  % Critical frequencies (normalized)
A = [1,1,0.5,0.5,0,0];             % Critical magnitude values
h = ss_fir2(N,F,A);                % Design the filter
Omega = [0:0.01:1]*pi;             % Frequencies for the graph
Hk = freqz(h,1,Omega);             % Compute filter spectrum
% Graph the magnitude response and the specifications
plot(Omega,abs(Hk),2*pi*F,A,'r--'); grid;         
axis([0,pi,0,1.2]);
title('|H(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude');