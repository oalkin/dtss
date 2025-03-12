% Script: exdt_8_8.m
h = [3,2,1,2,3];           % Impulse response
Omega = [-1:0.005:1]*pi;   % Vector of angular frequencies
HDTFT = freqz(h,1,Omega);  % Compute the DTFT
tiledlayout(2,1);
nexttile;
plot(Omega,abs(HDTFT)); grid;
axis([-pi,pi,0,15]);
title('|H(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude')
nexttile;
plot(Omega,angle(HDTFT)); grid;
axis([-pi,pi,-pi,pi]);
title('\angle H(\Omega)');
xlabel('\Omega (rad)');
ylabel('Phase (rad)');