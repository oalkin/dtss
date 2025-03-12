% Script: mexdt_5_8.m
num = [1,-0.7686];         % Numerator polynomial
den = [1,-1.5371,0.9025];  % Denominator polynomial
zrs = roots(num);          % Compute zeros
pls = roots(den);          % Compute poles
Omega = [-1:0.001:1]*pi;   % Vector of frequencies
[mag,phs] = ss_freqz(zrs,pls,1,Omega);
tiledlayout(2,1);
nexttile;
plot(Omega,mag); grid;
xlabel('\Omega (rad)');
nexttile;
plot(Omega,phs); grid;
xlabel('\Omega (rad)');