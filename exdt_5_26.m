% Script: exdt_5_26.m
a = 0.7;       % Parameter 'a'
n = [-5:25];   % Vector of sample indices
% Compute the cross correlation
rxy = a.^n.*(n>=0)+a.^(n+1).*(n>=-1)+a.^(n+2).*(n>=-2);
% Graph the cross correlation
stem(n,rxy); grid;
axis([-5.5,25.5,-1,3]);
xlabel('n');
title('r_{xy}[n]');