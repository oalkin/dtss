% Script: exdt_1_6.m
n = [-9:9];
x = [2.3,-0.7,-1.6,1.3,1.7,2.1,2.9];
g = zeros(size(n));
g(~mod(n,3)) = x;
stem(n,g); grid;
axis([-10,10,-3,3]);
title('g[n]');
xlabel('n');
ylabel('Amplitude');