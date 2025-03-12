% Script: exdt_3_3.m
n = [-10:30];                           % Vector of sample indices
x = 1+cos(0.2*pi*n)+2*sin(0.3*pi*n);    % Compute the signal
k = [0:19];                             % Coefficient indices
% DTFS coefficients
c = [1,0,0.5,-j,0,0,0,0,0,0,0,0,0,0,0,0,0,j,0.5,0];
% Graph the signal and the DTFS spectrum
tiledlayout(3,1);
nexttile;
stem(n,x); grid;
axis([-10.5,30.5,-4,4]);
xlabel('Sample index n'); 
ylabel('Amplitude');
title('$\tilde{x}[n]$','Interpreter','latex');
nexttile;
stem(k,abs(c)); grid;
axis([-0.5,19.5,0,1.2]);
xlabel('DTFS index k'); 
ylabel('Magnitude');
title('$|\tilde{c}_{k}|$','Interpreter','latex');
nexttile;
stem(k,angle(c)); grid;
axis([-0.5,19.5,-pi,pi]);
xlabel('DTFS index k'); 
ylabel('Phase (rad)');
title('Phase of c_{k}');