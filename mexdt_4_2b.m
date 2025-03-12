% Script: mexdt_4_2b.m
Xa = @(omg) 2./(1+omg.*omg);
fs = 1;
Ts = 1/fs;
Omg = [-1:0.001:1]*pi;
XDTFT = zeros(size(Xa(Omg/Ts)));  % Eqn. (4.25)
for k=-5:5
  XDTFT = XDTFT+fs*Xa((Omg-2*pi*k)/Ts);
end
plot(Omg,XDTFT); grid;
axis([-pi,pi,0,2.5]);
title('X(\Omega)');
xlabel('\Omega (rad)');