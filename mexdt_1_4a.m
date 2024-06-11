% Script: mexdt_1_4a.m
n = [-10:30];
x = ss_dpulse(n,10);
stem(n,x);