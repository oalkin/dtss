% Script: exdt_1_13.m
n = [0:34];                % Create a vector of indices
x1 = 2*cos(0.4*pi*n);      % First sinusoid
x2 = 1.5*sin(0.48*pi*n);   % Second sinusoid
x = x1+x2;                 % Add the two components
% Graph the results
tiledlayout(3,1);
nexttile;
stem(n,x1); grid;
axis([-0.5,34.5,-4,4]);
xlabel('Index n');
title('x_{1}[n]=2 cos(0.4\pi n)');
nexttile;
stem(n,x2); grid;
axis([-0.5,34.5,-4,4]);
xlabel('Index n');
title('x_{2}[n]=1.5 sin(0.48\pi n)');
nexttile;
stem(n,x); grid;
axis([-0.5,34.5,-4,4]);
xlabel('Index n');
title('x[n]=x_{1}[n]+x_{2}[n]');