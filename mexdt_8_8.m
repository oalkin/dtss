% Script: mexdt_8_8.m
T = 1;
Omg1 = 0.2*pi;   
Omg2 = 0.36*pi;  
Rp = 2;                                     % dB passband ripple
As = 20;                                    % dB stopband attenuation
[N,Omgc] = buttord(Omg1/pi,Omg2/pi,Rp,As);  % Compute parameters
[numz,denz] = butter(N,Omgc)                % Discrete-time filter