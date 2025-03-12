% Script: exdt_3_4.m
Omega0 = 2*pi/5;   % Fundamental angular frequency in radians
k = [0:4];
% Find the DTFS coefficients
c = 1/5*(exp(-j*Omega0*k)+2*exp(-j*Omega0*2*k)+...
  3*exp(-j*Omega0*3*k)+4*exp(-j*Omega0*4*k));   % Eqn. (3.21)
% To verify, construct the signal x[n] from DTFS coefficients
n = [-12:15];      % Vector of sample indices
x = zeros(size(n));
for k=0:4          % Implement Eqn. (3.18)
  x = x+c(k+1)*exp(j*k*Omega0*n);  
end
stem(n,real(x)); grid;
axis([-12.5,15.5,-1,5]);
xlabel('Sample index');
ylabel('Amplitude');
title('x[n]');