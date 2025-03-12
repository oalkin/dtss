% Script: exdt_1_5.m
n = [-5:5];
g = x(2*n);
stem(n,g);
axis([-5,5,-0.5,1.5]);
title('g[n]=x[2n]');
xlabel('n');
ylabel('Amplitude');

function val = x(n)
  % Local function to compute signal x[n]
  % For details of the function ss_dsignal(), see MATLAB Exercise 1.7
  xData = [0.8,1,1.3,0.9,0.7,1.2,1.4,1.1,0.8,0.6,0.5,-0.2];
  val = ss_dsignal(n,xData,-5);
end