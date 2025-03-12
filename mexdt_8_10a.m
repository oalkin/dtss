% Script: mexdt_8_10a.m
Rp = 1;     % dB passband ripple
As = 25;    % dB stopband attenuation
F1 = 0.1;   % Corner frequencies F1 thru F4
F2 = 0.13;  
F3 = 0.24;
F4 = 0.27;
N = cheb1ord([2*F2,2*F3],[2*F1,2*F4],Rp,As)  % Compute filter order
[zrs,pls,gain] = cheby1(N,Rp,[2*F2,2*F3])    % Alternative syntax for cheby1()
[sos,gain] = zp2sos(zrs,pls,gain)            % Convert to SOS
Omg = [-1:0.001:1]*pi;                       % Vector of angular frequencies
H = gain*freqz(sos,Omg);                     % Alternative syntax for freqz()
plot(Omg,abs(H)); grid;
axis([-pi,pi,-0.1,1.1]);
title('|H(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude');