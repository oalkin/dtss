% Script: exdt_1_9.m
n = [-10:20];
x = 1/5*ss_dramp(n+8)-1/5*ss_dramp(n+3)-1/4*ss_dramp(n-4)+...
    1/2*ss_dramp(n-11)-1/4*ss_dramp(n-14)
stem(n,x); grid;
title('x[n]');
xlabel('n');
ylabel('Amplitude');