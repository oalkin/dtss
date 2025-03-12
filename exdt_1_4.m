% Script: exdt_1_4.m
n = [-5:10];
g = x(n)+0.5*x(n-4);
stem(n,g); grid;
axis([-5,10,-0.5,1.5]);
title('g[n]=x[n]+0.5 x[n-4]');
xlabel('n');
ylabel('Amplitude');

function val = x(n)
  % Local function to compute signal x[n]
  % For details of the function ss_dsignal(), see MATLAB Exercise 1.7
  xData = [0.2,0.4,0.6,0.8,0.8,0.8,0.8,0.4];
  val = ss_dsignal(n,xData,-3);
end