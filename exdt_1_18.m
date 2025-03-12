% Script: exdt_1_18.m
n=[-10:10];
x = mysig(n);
xrev = mysig(-n);
xe = 0.5*(mysig(n)+mysig(-n));
xo = 0.5*(mysig(n)-mysig(-n));
tiledlayout(2,2);
nexttile;
stem(n,x); title('x[n]');
axis([-10,10,-1.2,1.2]);
nexttile;
stem(n,xrev); title('x[-n]');
axis([-10,10,-1.2,1.2]);
nexttile;
stem(n,xe); title('x_{e}[n]');
axis([-10,10,-1.2,1.2]);
nexttile;
stem(n,xo); title('x_{o}[n]');
axis([-10,10,-1.2,1.2]);

function x = mysig(n)
  N = 7;
  x = ss_dstep(n)-ss_dstep(n-N);
end