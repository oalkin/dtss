% Script: mexdt_8_2b.m
[x,fs] = audioread('GuitarA2.flac');
y = zeros(size(x));   % Create an all-zero vector for the output
nSamp = length(x);    % Number of samples
buffer = zeros(2,1);  % Holds w[n-1] and w[n-2]
for n=1:nSamp
  [y(n),buffer] = ss_res(x(n),0.1881,0.9915,0.0085,buffer);
end
t = [0:nSamp-1]/fs;   % Vector of time instants
plot(t,y); grid;