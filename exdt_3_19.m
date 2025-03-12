% Script: exdt_3_19.m
Omg = [-3:0.01:3]*pi;   % Vector of angular frequencies.
% Compute the transforms
HOmg = 1./(1-2/3*exp(-j*Omg));
XOmg = 1./(1-3/4*exp(-j*Omg));
YOmg = -8./(1-2/3*exp(-j*Omg))+9./(1-3/4*exp(-j*Omg));   % See Example 3.19
% Graph the magnitude and the phase of each transform
tiledlayout(3,2);
nexttile;
plot(Omg,abs(HOmg)); grid;
axis([-3*pi,3*pi,0,5]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');
nexttile;
plot(Omg,angle(HOmg)); grid;
axis([-3*pi,3*pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');
nexttile;
plot(Omg,abs(XOmg)); grid;
axis([-3*pi,3*pi,0,5]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|X(\Omega)|');
nexttile;
plot(Omg,angle(XOmg)); grid;
axis([-3*pi,3*pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle X(\Omega)');
nexttile;
plot(Omg,abs(YOmg)); grid;
axis([-3*pi,3*pi,0,15]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|Y(\Omega)|');
nexttile;
plot(Omg,angle(YOmg)); grid;
axis([-3*pi,3*pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle Y(\Omega)');