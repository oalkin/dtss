% Script: mexdt_5_13b.m
yn_fnc = @(n) 2*(1/2)^n+5*(1/3)^n;  % Anonymous function for yn
yn = sym(yn_fnc);                   % Convert to symbolic expression
n = [0:10];
y = eval(yn);                       % Evaluate symbolic expression
stem(n,y); grid;
title('y[n]');
xlabel('Sample index n');
ylabel('Amplitude');