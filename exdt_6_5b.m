% Script: exdt_6_5b.m
%-------------------------------------------------
% Important: Run the script "ex_6_5a.m" first
%-------------------------------------------------
% Find the output signal symbolically
yn = C*xn
% Evaluate and graph the output signal
n = [0:19];
y = subs(yn,'n',n);
stem(n,y); grid;
xlabel('n');
title('y[n]');