% Script: mexdt_7_5.m
n = [0:9];
x = [0,2,3,4,4.5,3,1,-1,2,1];
tiledlayout(4,1);
nexttile;
stem(n,x); grid;
title('x[n]_{mod 10}')
xlabel('Sample index n');
nexttile;
g = ss_cshift(x,3);   % Circular shift to the right by 3 samples
stem(n,g); grid;
title('x[n-3]_{mod 10}')
xlabel('Sample index n');
nexttile;
g = ss_cshift(x,-2);  % Circular shift to the left by 2 samples
stem(n,g); grid;
title('x[n+2]_{mod 10}')
xlabel('Sample index n');
nexttile;
g = ss_crev(x);       % Circular time reversal
stem(n,g); grid;
title('x[-n]_{mod 10}')
xlabel('Sample index n');