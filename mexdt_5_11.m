% Script: mexdt_5_11.m
num=[1,0,-7,6];                   % Numerator coefficients
den=[1,-1,-0.34,0.966,-0.2403];   % Denominator coefficients
[r,p,k] = residue(num,den)
[num1,den1] = residue(r(3:4),p(3:4),[]);
H1 = tf(num1,den1,-1)
[num2,den2] = residue(r(1:2),p(1:2),[]);
H2 = tf(num2,den2,-1)
H = H1+H2