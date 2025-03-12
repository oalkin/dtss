% Script: exdt_7_4.m
Omg = ([0:1023]/1024+eps)*2*pi;   % Vector of angular frequencies
Xk = [1,0,0.5,0,2,0,0,0,0,0];     % Vector of DFT samples
N = 10;                           % Length of signal
XDTFT = zeros(size(Omg));
% Compute DTFT using Eqn. (7.16)
for k=0:N-1
  XDTFT = XDTFT + Xk(k+1)*B(Omg-2*pi*k/N,N);
end
k = [0:9];
% Graph magnitude and phase
tiledlayout(2,1);
nexttile;
plot(Omg,abs(XDTFT)); grid;
axis([0,2*pi,-0.2,2.2]);
title('|X(\Omega)|')
xlabel('\Omega (rad)')
hold on;
stem(2*pi*k/N,abs(Xk(k+1)),'o');
hold off;
nexttile;
plot(Omg,angle(XDTFT)); grid;
axis([0,2*pi,-pi,pi]);
title('\angle X(\Omega)')
xlabel('\Omega (rad)')
hold on;
stem(2*pi*k/N,angle(Xk(k+1)),'o');
hold off;

function out = B(Omg,N)
% Local function to evaluate the BN(Omega) given by Eqn. (7.15)
  mag = sin(N*Omg/2)./(N*sin(Omg/2));
  phs = -Omg*(N-1)/2;
  out = mag.*exp(j*phs);
end