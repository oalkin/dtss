% Script: mexdt_2_2.m
clear ss_movavg4;          % Clear persistent variables
load 'djia_data.mat';      % Load the input data stream
xstream = [x2013(251:253),x2014];  % Input stream with 3 extra samples
ystream = [];              % Create an empty output stream
nsamp = length(xstream);   % Number of samples in the input stream
for n=1:nsamp
  x = xstream(n);          % "x" is the current input sample
  y = ss_movavg4(x);       % "y" is the current output sample
  ystream = [ystream,y];   % Append "y" to the output stream
end;
% Graph input and output signals
ystream = ystream(4:nsamp);   % Drop the first 3 samples
plot([0:252],x2014,[0:252],ystream);
axis([0,252,15000,18500]);