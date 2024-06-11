% Script: mexdt_1_4c.m
n = [-20:20];
x = ss_dtriangle(n,10);
stem(n,x);