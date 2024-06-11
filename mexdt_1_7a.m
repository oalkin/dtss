% Script: mexdt_1_7a.m
xData = [0.2,0.4,0.6,0.8,0.8,0.8,0.8,0.4];
n = [-10:10];  % Index range for the result
g = ss_dsignal(n,xData,-3)+0.5*ss_dsignal(n-4,xData,-3)
stem(n,g);