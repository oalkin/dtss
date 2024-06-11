% Script: exdt_1_3.m
n = [-2:6];
% Arrange vectors x1 and x2 with the first sample at n=-2 and the 
% last sample at n=6
x1 = [1.5,1.9,3.2,-1.1,4.8,0.4,0,0,0];
x2 = [0,0,0,2.8,4.1,1.7,-3.3,-1.8,2.1];
g = x1.*x2;
stem(n,g); grid;
title('g[n]=x_{1}[n] x_{2}[n]');
xlabel('n');
ylabel('Amplitude');
