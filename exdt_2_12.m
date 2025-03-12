% Script: exdt_2_12.m
n = [0:49];    % Vector of sample indices
% Compute the natural solution for y[-1]=19 and y[-2]=53
yh = 2*(0.5).^n+5*(1/3).^n;
% *Graph the natural response
stem(n,yh); grid;
axis([-0.5,49.5,-1,8]);
title('Natural response y_h(t) of the second-order system of Example 2.12');
xlabel('Index n'); 
ylabel('Amplitude');