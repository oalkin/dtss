% Script: mexdt_2_3b.m
load 'djia_data.mat';      % Load the input data stream
xstream = x2014;           % Input stream
ystream = [];              % Create an empty output stream
nsamp = length(xstream);   % Number of samples in the input stream.
buffer = x2013(204:253)';  % Set up length-50 buffer with 2013 data
for n=1:nsamp              % Repeat for the specified range:
  x = xstream(n);          %   "x" is the current input sample
  [y,buffer] = ss_movavgb(x,50,buffer); %   "y" is the current output sample
  ystream = [ystream,y];   %   Append "y" to the output stream
end;
% Graph input and output signals
plot([0:252],xstream,[0:252],ystream);
axis([0,252,15000,18500]);