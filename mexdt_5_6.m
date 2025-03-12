% Script: mexdt_5_6.m
% Verify the right-sided result found in Example 5.31
x = ss_longdiv([3,-1,0],[1,-3,3,-1],6)
% Verify the left-sided result found in Example 5.32, possibility 1
num = fliplr([1,1,-2]);
den = fliplr([1,-2.5,1]);
x = ss_longdiv(num,den,6)