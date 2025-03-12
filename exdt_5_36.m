% Script: exdt_5_36.m
% Define an anonymous function for H(z)
H = @(z) (z+1)./(z.*z-5/6*z+1/6);
n = [-10:20];   % Vector of sample indices
% Compute the input signal
x = (0.9).^n.*cos(0.2*pi*n);
% Evaluate the system function for z=0.9*exp(j*0.2*pi)
Htmp = H(0.9*exp(j*0.2*pi))
H0 = abs(Htmp)
Theta0 = angle(Htmp)
% Compute the output signal
y = H0*(0.9).^n.*cos(0.2*pi*n+Theta0);
% Graph input and output signals
tiledlayout(2,1);
nexttile;
stem(n,x); grid;
axis([-10.5,20.5,-4,4]);
xlabel('n');
title('x[n]');
nexttile;
stem(n,y); grid;
axis([-10.5,20.5,-15,15]);
xlabel('n');
title('y[n]');