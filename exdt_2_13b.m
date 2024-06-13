% Script: exdt_2_13b.m
% Set parameters
c1 = 5.12;
c2 = 3.52;
n = [0:49];   % Vector of sample indices
% Compute the natural response.
yh = c1*((0.8).^n)+c2*n.*((0.8).^n);
% Graph the natural response
stem(n,yh); grid;
axis([-0.5,49.5,-5,10]);
title('Natural response y_h(t) for Example 2.13 part (b)');
xlabel('Index n');
ylabel('Amplitude');