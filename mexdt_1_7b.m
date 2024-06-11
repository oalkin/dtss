% Script: mexdt_1_7b.m
xData = [0.8,1.0,1.3,0.9,0.7,1.2,1.4,1.1,0.8,0.6,0.5,-0.2];
n = [-10:10];  % Index range for the result
g = ss_dsignal(2*n,xData,-5);
stem(n,g);