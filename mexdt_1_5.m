% Script: mexdt_1_5.m
x = [0,1,2,3,4];
n = [-15:15]; 
xtilde = ss_dper(x,n);
stem(n,xtilde); grid;
title('Periodic extension of x[n]')
xlabel('n');
ylabel('Amplitude');