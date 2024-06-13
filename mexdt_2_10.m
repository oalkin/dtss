% Script: mexdt_2_10.m
load 'djia_data.mat';
x = [x2013(205:253),x2014];
h = ones(1,50)/50;
y = conv(h,x);
y = y(50:302);
n = [0:252];
plot(n,x2014,'-',n,y,'--');
axis([0,252,15000,18500]);