% Script: mexdt_1_6b.m
n = [-10:10];  % Index range for the result
g = mysig(n)+mysig(-n)
stem(n,g);

function x = mysig(n)
  xData = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
  initIndex = -7;     % Initial index
  finalIndex = 2;     % Final index
  numSamples = 10;    % Number of samples in xData
  xData = [xData,0];  % Append a zero for all out of range samples
                      % (this will be needed in line 15)
  n1 = (n>=initIndex & n<= finalIndex);  % Indices that are in range
  n(n1) = n(n1)-initIndex+1;  % Convert to MATLAB index
  n(~n1) = numSamples+1;      % Fix indices that are out of range
  x = xData(n);               % Return data
end