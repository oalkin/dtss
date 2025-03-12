% Script: exdt_3_17.m
alpha = 0.4;            % Parameter 'alpha'
Omg = [-3:0.01:3]*pi;   % Vector of angular frequencies
% Compute the transform
XOmg = (1-alpha*alpha)./(1-2*alpha*cos(Omg)+alpha*alpha);   % Eqn. (3.104)
% Graph the transform
plot(Omg,XOmg); grid;
axis([-3*pi,3*pi,0,3]);
xlabel('\Omega (rad)');
title('X(\Omega)');