% Script: mexdt_5_2a.m
X = @(z) (z-0.7686)./(z.*z-1.5371*z+0.9025);
Omega = [-1:0.001:1]*pi;
Xdtft = X(exp(j*Omega));
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