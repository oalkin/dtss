% Script: mexdt_2_4b.m
load 'djia_data.mat';      % Load the input data stream
xstream = x2014;           % Input stream
ystream = [];              % Create an empty output stream
nsamp = length(xstream);   % Number of samples in the input stream
alpha = 0.1;               % Parameter for exponential smoother
ynm1 = 0;                  % Initialize the buffer variable
for n=1:nsamp                           % Repeat for the specified range:
  x = xstream(n);                       %   "x" is the current input
  [y,ynm1] = ss_smoothb(x,alpha,ynm1);  %   "y" is the current output
  ystream = [ystream,y];                %   Append "y" to the output stream
end;
% Graph input and output signals
plot([0:nsamp-1],xstream,[0:nsamp-1],ystream);
axis([0,252,15000,18500]);