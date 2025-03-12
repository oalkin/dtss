% Script: mexdt_5_2b.m
num = [0,1,-0.7686];
den = [1,-1.5371,0.9025];
Omega = [-1:0.001:1]*pi;
[Xdtft,Omega] = freqz(num,den,Omega);
tiledlayout(2,1);
nexttile;
plot(Omega,abs(Xdtft)); grid;
title('|X(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude');
nexttile;
plot(Omega,angle(Xdtft)); grid;
title('\angle X(\Omega)');
xlabel('\Omega (rad)');
ylabel('Magnitude');