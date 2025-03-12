% Script: mexdt_8_9.m
Rp = 1;
As = 25;
F1 = 0.1;
F2 = 0.13;
F3 = 0.24;
F4 = 0.27;
N = cheb1ord([2*F2,2*F3],[2*F1,2*F4],Rp,As)
[numz,denz] = cheby1(N,Rp,[2*F2,2*F3])
Omg = [-1:0.001:1]*pi;
H = freqz(numz,denz,Omg);
plot(Omg,abs(H)); grid;
axis([-pi,pi,-0.1,1.1]);
title('|H(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude');