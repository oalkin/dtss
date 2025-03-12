% Script: exdt_5_35b.m
% Define an anonymous function for H(z)
H = @(z) (z+1)./(z.*z-5/6*z+1/6);
n = [-10:20];   % Vector of sample indices
% Compute the input signal
x = (0.9*exp(j*0.2*pi)).^n;
% Evaluate the system function for z=0.9\,e^{j0.2\pi}
Htmp = H(0.9*exp(j*0.2*pi))
% Compute the output signal
y = Htmp*x;
% Graph real and imaginary parts of the output signal
tiledlayout(2,1);
nexttile;
stem(n,real(y)); grid;
axis([-10.5,20.5,-15,15]);
xlabel('n');
title('Re\{ y[n] \}');
nexttile;
stem(n,imag(y)); grid;
axis([-10.5,20.5,-15,15]);
xlabel('n');
title('Im\{ y[n] \}');