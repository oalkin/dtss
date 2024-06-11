% Script: exdt_1_8.m
n = [-10:20];
x = ss_dstep(n+3)-1.8*ss_dstep(n-3)+2.2*ss_dstep(n-7)-1.4*ss_dstep(n-12);
stem(n,x); grid;
axis([-10,20,-1.5,1.5]);
title('x[n]');
xlabel('n');
ylabel('Amplitude');