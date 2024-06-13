% Script: mexdt_2_13a.m
[x,fs] = audioread('AG_Duet_22050_Hz.flac');
xLeft = x(:,1);                % Left channel
numSamples = size(xLeft,1);    % Number of samples
yLeft = zeros(size(xLeft));    % Create output vector
buffer = zeros(1024,1);        % L = 1024
for i=1:numSamples             % Loop through audio samples
  [yLeft(i),buffer] = ss_echo(xLeft(i),0.8,buffer);
end
sound(yLeft,fs);               % Play back the output vector