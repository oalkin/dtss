% Script: exdt_3_28.m
N = 4;                   % Moving average filter length
Omg = [-1:0.002:1]*pi;   % Vector of angular frequencies
% Compute the system function
HOmg = (1-exp(-j*Omg*N))./(N*(1-exp(-j*Omg)));   % See Example 3.28
% Graph the magnitude and the phase of the system function
tiledlayout(2,1);
nexttile;
plot(Omg,abs(HOmg)); grid;
axis([-pi,pi,0,1.5]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');
nexttile;
plot(Omg,angle(HOmg)); grid;
axis([-pi,pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');