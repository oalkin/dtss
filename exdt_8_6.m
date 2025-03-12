% Script: exdt_8_6.m
% Create vectors for numerator and denominator coefficients of G(s)
num = [2];
den = [1,3,2];
% Set a vector of radian frequencies
omg = [0:0.01:5];
% Compute the frequency spectrum of the analog prototype
G = freqs(num,den,omg);
% Obtain H(z) through bilinear transformation
[numz,denz] = bilinear(num,den,0.5)
% Set a vector of angular frequencies
Omg = [0:0.001:1]*pi;
% Compute the frequency spectrum of the discrete-time filter
H = freqz(numz,denz,Omg);
% Graph the frequency responses
tiledlayout(2,2);
nexttile;
plot(omg,abs(G)); grid;
axis([0,5,0,1.2]);
xlabel('\omega (rad/s)');
ylabel('Magnitude');
title('|G(\omega)|');
nexttile;
plot(omg,angle(G)); grid;
axis([0,5,-pi,pi]);
xlabel('\omega (rad/s)');
ylabel('Phase (rad)');
title('\angle G(\omega)');
nexttile;
plot(Omg,abs(H)); grid;
axis([0,pi,0,1.2]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');
nexttile;
plot(Omg,angle(H)); grid;
axis([0,pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');