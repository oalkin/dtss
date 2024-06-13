% Script: exdt_2_22.m
n = [-10:39];   % Vector of sample indices
% Compute sections of y[n]
y1 = -9*(0.9.^n-1/0.9);   % See Example 2.22
y2 = 9.8168*0.9.^n;       % See Example 2.22
% Construct y[n] by adding the sections together
y = y1.*((n>=0)&(n<=6))+y2.*(n>6);
% Graph the response.
stem(n,y); grid;
axis([-10.5,39.5,-1,6]);
title('Convolution result y[n] for Example 2.22');
ylabel('Amplitude');
xlabel('Index n');