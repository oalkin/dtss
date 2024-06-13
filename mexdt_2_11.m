% Script: mexdt_2_11.m
% Load the data file
load('sundata_monthly.mat');
% Set up hn, the impulse response of length-12 moving average filter
hn = ones(12,1)/12;  
y = conv(hn,sspots_mo(:,3));      % Convolve hn with 3rd column data
y = y(1:end-11);                  % Drop the last 11 samples
sspots_mo(:,3) = y;               % Replace 3rd column data
x = downsample(sspots_mo,12,11);  % Downsample to keep mo 12 of each yr
% Graph yearly averages
plot(x(:,1),x(:,3));
axis([1749,2014,0,200]);
xlabel('Year');
ylabel('Sunspot numbers');