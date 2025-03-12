% Script: exdt_1_7.m
n = [-10:10];
g = x(n)+x(-n);
stem(n,g); grid;
axis([-10,10,0,2]);
title('g[n]=x[n]+x[-n]');
xlabel('n');
ylabel('Amplitude');

function val = x(n)
  % Local function to compute signal x[n]
  % For details of the function ss_dsignal(), see MATLAB Exercise 1.7
  xData = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
  val = ss_dsignal(n,xData,-7);
end