%Script: mexdt_1_1c.m
n = [-20:59];
w = (n>=0)&(n<=39);
x3 = sin(0.2*n).*w;
stem(n,x3);