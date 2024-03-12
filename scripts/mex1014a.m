% Script: /*\mexfiledthdr{a}*/
fs = 22050;               % Sampling rate
f0 = 660;                 % Analog center frequency
fb = 60;                  % Analog bandwidth
Omg0 = 2*pi*f0/fs;        % Angular center frequency
Omgb = 2*pi*fb/fs;        % Angular bandwidth
[r,gain,zrs,pls] = ss_respar(Omg0,Omgb);   % Compute parameters
Omega = [-500:500]/500*pi;                 % Frequency vector from -pi to pi
[mag,phs] = ss_freqz(zrs,pls,gain,Omega);  % Compute magnitude and phase
plot(Omega,mag); grid;                     % Graph magnitude
axis([-pi,pi,0,1.2]);