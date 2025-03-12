% Script: exdt_3_12a.m
L = 3;                                   % Pulse width
% Create a vector of angular frequencies
Omg = [-3:0.01:3]*pi+0.0001;             % Avoid division by zero
% Compute the transform.
XOmg = sin(Omg*(2*L+1)/2)./sin(Omg/2);   % Eqn. (3.86)
% Graph the transform
plot(Omg,XOmg); grid;
axis([-3*pi,3*pi,-5,15]);
xlabel('\Omega (rad)');
title('X(\Omega)');