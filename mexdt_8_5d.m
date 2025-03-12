% Script: mexdt_8_5d.m
load noisyECG.mat
fs = 360;                           % Sampling rate used in ECG data
f0 = 60;                            % Center frequency of notch filter
fb = 6;                             % Allow 6 Hz width
Omg0 = 2*pi*f0/fs;                  % Angular center frequency
Omgb = 2*pi*fb/fs;                  % Angular bandwidth
[r,gain,zrs,pls] = ss_notchpar(Omg0,Omgb);
buffer = zeros(2,1);                % Initialize buffer
y = ss_notchf(x,Omg0,r,gain,buffer);
plot(t,y);