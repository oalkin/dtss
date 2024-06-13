% Script: mexdt_2_6.m
clear ss_system1;         % Clear persistent variables
xstream = ones(1,50);     % Input data stream
ystream = [];             % Create an empty output stream.
nsamp = length(xstream);  % Number of samples in the input stream
for n=1:nsamp             % Repeat for the specified range:
  x = xstream(n);         %   "x" is the current input sample
  y = ss_system1(x);      %   "y" is the current output sample
  ystream = [ystream,y];  %   Append "y" to the output stream
end;
% Graph the output signal
stem([0:nsamp-1],ystream);
title('The output signal');
xlabel('Index n');
ylabel('y[n]');