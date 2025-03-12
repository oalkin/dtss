% Script: exdt_8_4a.m
% Set vectors numerator and denominator polynomials
num = [0.625];
den = [1,1.1542,1.4161,0.625];
% Find a partial fraction expansion for G(s) -- See Eqn. (8.61)
[r,p,k] = residue(num,den)
% Convert poles of G(s) to poles of H(z) and find a partial fraction
% expansion for H(z) -- See Eqn. (8.64)
T = 0.2;      % Sampling interval
r = r*T       % Residues
p = exp(p*T)  % Poles of H(z)
% Form numerator and denominator polynomials for H(z)
[num1,den1] = residue(r,p,k)
% Compute the magnitude of the frequency response for H(z)
Omega = [0:0.001:1]*pi;
H = freqz(num1,den1,Omega);
HMag = abs(H);
HPhs = angle(H);
% Graph the magnitude and the phase
tiledlayout(2,1);
nexttile;
plot(Omega,HMag); grid;
axis([0,pi,0,1.2]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');
nexttile;
plot(Omega,HPhs); grid;
axis([0,pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');