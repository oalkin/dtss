% Script: exdt_5_38b.m
% Find left and right sided components of h[n] from the analytical
% solution obtained in Example 5.38
nleft = [-10:-1];
hleft = 0.0312*(-1.2).^nleft-0.7813*(2).^nleft;
nright = [0:20];
hright = -0.75*(0.8).^nright;
n = [nleft,nright];
h = [hleft,hright];
stem(n,h); grid;