% Script: exdt_3_29.m
Omega0 = pi/5;  % Angular frequency of the sinusoidal input signal
% Evaluate the system function at 'Omega0'
sf = (1-0.2*exp(-j*Omega0))./(1-0.9*exp(-j*Omega0)+0.36*exp(-j*2*Omega0))
sfmag = abs(sf)    % Magnitude
sfphs = angle(sf)  % Phase
% Compute the input signal
n = [0:49];
xn = 5*cos(pi*n/5);
% Compute the steady-state output signal
yn = sfmag*5*cos(pi*n/5+sfphs);
% Graph the signals
tiledlayout(2,1);
nexttile;
stem(n,xn); grid;
axis([0,49,-6,6]);
xlabel('Sample index  n');
ylabel('Amplitude');
title('x[n]');
nexttile;
stem(n,yn); grid;
axis([0,49,-12,12]);
xlabel('Sample index  n');
ylabel('Amplitude');
title('y[n]');