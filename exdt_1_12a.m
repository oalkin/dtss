% Scriptexdt_1_12a.m
n = [0:99];             % Create a vector of indices.
x = cos(0.2*n);         % Compute signal samples.
% Graph the signal.
stem(n,x); grid;
axis([-0.5,99.5,-1.5,1.5]);
title('x[n]=cos(0.2 n)');
xlabel('Index n');