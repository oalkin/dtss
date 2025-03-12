% Script: exdt_8_3.m
f0 = 220;                                   % Analog center frequency
fb = 20;                                    % Analog bandwidth
fs = 22050;                                 % Sampling rate
Omg0 = 2*pi*f0/fs;                          % Angular center frequency
Omgb = 2*pi*fb/fs;                          % Angular bandwidth
[r,gain,zrs,pls] = ss_notchpar(Omg0,Omgb);  % Compute parameter values
Omega = [-1000:1000]/1000*pi;               % Create vector of angular frequencies 
[mag,phs] = ss_freqz(zrs,pls,gain,Omega);   % Compute magnitude and phase
plot(Omega,mag); grid;                      % Graph magnitude
axis([-pi,pi,0,1.2]);
title('|H(\Omega)| for Example 8.3')
xlabel('\Omega (rad)');
ylabel('Magnitude');