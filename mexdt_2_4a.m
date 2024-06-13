% Script: mexdt_2_4a.m
clear ss_smooth;           % Clear persistent variables
load 'djia_data.mat';      % Load the input data stream
xstream = x2014;           % Input stream
ystream = [];              % Create an empty output stream
nsamp = length(xstream);   % Number of samples in the input stream
alpha = 0.1;               % Parameter for exponential smoother
for n=1:nsamp              % Repeat for the specified range:
  x = xstream(n);          %   "x" is the current input sample
  y = ss_smooth(x,alpha);  %   "y" is the current output sample
  ystream = [ystream,y];   %   Append "y" to the output stream
end;
% Graph input and output signals
plot([0:nsamp-1],xstream,[0:nsamp-1],ystream);
axis([0,252,15000,18500]);