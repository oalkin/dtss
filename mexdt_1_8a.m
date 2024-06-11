% Script: mexdt_1_8a.m
load 'sundata_monthly.mat';      % Load the data
year = sspots_mo(:,1);           % Leftmost column of data matrix
span = year>=1810 & year<=1850;  % Span of years to be selected
x = sspots_mo(span,:);           % Copy specified range into variable "x"
years = x(:,1);                  % Vector of years
months = x(:,2);                 % Vector of months
index = years + (months-1)/12;   % Create a composite index
% Graph the data from 1810 to 1850
plot(index,x(:,3));              % Graph spot count versus index
axis([1810,1850,0,250]);         % Set axis limits