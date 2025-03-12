% Script: mexdt_5_10.m
num = [0,1,0,-7,6];
den = [1,-1,-0.34,0.966,-0.2403];
[zrs,pls,k] = tf2zp(num,den);
[sos,G] = zp2sos(zrs,pls,k)