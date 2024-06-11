% Script: exdt_1_2.m
n = [-5:10];
% Arrange vectors x1 and x2 with the first sample at n=-5 and the 
% last sample at n=10
x1 = [0,0,0,1.5,1.9,3.2,-1.1,4.8,0.4,0,0,0,0,0,0,0];
x2 = [0,0,0,0,0,0,2.8,4.1,1.7,-3.3,-1.8,2.1,0,0,0,0];
g = 3*x1-2*x2+5;
stem(n,g); grid;
title('g[n]=3x_{1}[n]-2x_{2}[n]+5');
xlabel('n');
ylabel('Amplitude');