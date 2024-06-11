% Script: mexdt_1_4b.m
n = [-10:30];
x = ss_dpulse(n,10)-0.8*ss_dpulse(n-10,15);
stem(n,x);