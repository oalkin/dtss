% Script: exdt_3_27.m
Omg = [-1:0.002:1]*pi;   % Vector of angular frequencies
% Compute the system function
HOmg = (1-0.2*exp(-j*Omg))./(1-0.9*exp(-j*Omg)+0.36*exp(-j*2*Omg));
% Graph the magnitude and the phase of the system function
tiledlayout(2,1);
nexttile;
plot(Omg,abs(HOmg)); grid;
axis([-pi,pi,0,2.5]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');
nexttile;
plot(Omg,angle(HOmg)); grid;
axis([-pi,pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');