% Script: exdt_1_12b.m
n = [0:39];                % Create a vector of indices.
x = cos(0.2*pi*n+pi/5);    % Compute signal samples.
% Graph the signal.
stem(n,x); grid;
axis([-0.5,39.5,-1.5,1.5]);
title('x[n]=cos(0.2\pi n + \pi/5)');
xlabel('Index n');