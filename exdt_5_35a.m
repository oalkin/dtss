% Script: exdt_5_35a.m
n = [-10:20];                 % Vector of sample indices
x = (0.9*exp(j*0.2*pi)).^n;   % Compute the input signal
% Graph real and imaginary parts of the input signal
tiledlayout(2,1);
nexttile;
stem(n,real(x)); grid;
axis([-10.5,20.5,-4,4]);
xlabel('n');
title('Re\{ x[n] \}');
nexttile;
stem(n,imag(x)); grid;
axis([-10.5,20.5,-4,4]);
xlabel('n');
title('Im\{ x[n] \}');