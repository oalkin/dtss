% Script: mexdt_5_9.m
num=[1,0,-7,6];
den=[1,-1,-0.34,0.966,-0.2403];
zrs = roots(num)
pls = roots(den)
num1 = poly([zrs(1),zrs(3)])
den1 = poly([pls(1),pls(4)])
num2 = [1,-zrs(2)]
den2 = poly([pls(2),pls(3)])