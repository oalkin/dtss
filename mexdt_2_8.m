% Script: mexdt_2_8.m
h = [4,3,2,1];
x = [-3,7,4];
% Assume the first sample in vector 'h' is for n=5, and the first 
% sample in vector 'x' is for n=7.
[y,n] = ss_conv(h,x,5,7)
stem(n,y); grid;
title('y[n]');
xlabel('n');
ylabel('Amplitude')