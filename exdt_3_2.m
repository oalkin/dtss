% Script: exdt_3_2.m
n = [-4:14];                     % Vector of sample indices
x = cos(0.2*pi*n);               % Compute the signal
k = [0:9];                       % Coefficient indices
c = [0,0.5,0,0,0,0,0,0,0,0.5];   % DTFS coefficients
% Graph the signal and the DTFS spectrum
tiledlayout(2,1);
nexttile;
stem(n,x); grid;
axis([-4.5,14.5,-1.2,1.2]);
xlabel('Sample index n'); 
ylabel('Amplitude');
title('$\tilde{x}[n]$','Interpreter','latex');
nexttile;
stem(k,c); grid;
axis([-0.5,9.5,-0.2,0.8]);
xlabel('DTFS index k'); 
ylabel('Amplitude');
title('c_{k}');