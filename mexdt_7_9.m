% Script: mexdt_7_9.m
x = [1,3,2,-4,6];  % Vector for signal x[n]
h = [5,4,3,2,1];   % Vector for signal h[n]
y = ss_conv2(x,h)