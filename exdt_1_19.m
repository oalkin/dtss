% Script: exdt_1_19.m
n = [-25:25];
a = 0.8;
Omg0 = 0.2*pi;
x = @(n) (a.^n).*cos(Omg0*n).*ss_dstep(n);  % Signal x[n]
xEven = 0.5*x(n)+0.5*x(-n);                 % Even component
xOdd = 0.5*x(n)-0.5*x(-n);                  % Odd component
tiledlayout(3,1);
nexttile;
stem(n,x(n));
axis([-25,25,-1,1]);
xlabel('n');
title('The signal x(n)');
nexttile;
stem(n,xEven);
axis([-25,25,-1,1]);
xlabel('n');
title('Even component');
nexttile;
stem(n,xOdd);
axis([-25,25,-1,1]);
xlabel('n');
title('Odd component');