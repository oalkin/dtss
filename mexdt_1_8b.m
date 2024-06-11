% Script: mexdt_1_8b.m
load 'sundata_monthly.mat';      % Load the data
x = sspots_mo(sspots_mo(:,1)>=1810 & sspots_mo(:,1)<=1850,:);
index = x(:,1)+(x(:,2)-1)/12;
% Graph the data from 1810 to 1850
plot(index,x(:,3));              % Graph spot count versus index
axis([1810,1850,0,250]);         % Set axis limits