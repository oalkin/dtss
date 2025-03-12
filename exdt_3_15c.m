% Script : exdt_3_15c.m
L = 50;
Omg = [-14:0.005:14];   % Vector of angular frequencies
% Compute the transform
XOmg = sin(0.5*Omg*(2*L+1))./sin(0.5*Omg);
% Graph the transform
plot(Omg,XOmg); grid;
axis([-14,14,-10,110]);
xlabel('\Omega (rad)'); 
title('W(\Omega)  (for L=50)');