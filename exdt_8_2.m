% Script: exdt_8_2.m
f0 = 660;                                  % Analog center frequency
fb = 60;                                   % Analog bandwidth
fs = 22050;                                % Sampling rate
Omg0 = 2*pi*f0/fs;                         % Angular center frequency
Omgb = 2*pi*fb/fs;                         % Angular bandwidth
[r,gain,zrs,pls] = ss_respar(Omg0,Omgb);   % Compute parameter values
Omega = [-1000:1000]/1000*pi;              % Create vector of angular frequencies 
[mag,phs] = ss_freqz(zrs,pls,gain,Omega);  % Compute magnitude and phase
plot(Omega,mag); grid;                     % Graph magnitude
axis([-pi,pi,0,1.2]);
title('|H(\Omega)| for Example 8.2')
xlabel('\Omega (rad)');
ylabel('Magnitude');