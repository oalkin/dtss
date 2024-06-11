% Script: mexdt_1_3c.m
n = [-5:10];
x = ss_dimpulse(n)+0.5*ss_dimpulse(n-3)-0.8*ss_dimpulse(n-5);
stem(n,x);