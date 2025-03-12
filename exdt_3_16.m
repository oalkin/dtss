% Script: exdt_3_16.m
alpha = 0.4;            % Parameter 'alpha'
Omg = [-3:0.01:3]*pi;   % Vector of angular frequencies
% Compute the transform
XOmg = exp(-j*Omg)./(1-alpha*exp(-j*Omg));   % See Example 3.16
% Graph the magnitude and the phase of the transform
tiledlayout(2,1);
nexttile;
plot(Omg,abs(XOmg)); grid;
axis([-3*pi,3*pi,0,2]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|X(\Omega)|');
nexttile;
plot(Omg,angle(XOmg)); grid;
axis([-3*pi,3*pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle X(\Omega)');