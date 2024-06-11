function x = ss_dsignal(n,xData,initIndex)
  numSamples = max(size(xData));  % Number of samples
  finalIndex = initIndex+numSamples-1;
  xData = [xData,0];  % Append a zero for all out of range samples 
                      % (this will be needed in line 8)
  n1 = (n>=initIndex & n<= finalIndex);  % Indices that are in range
  n(n1) = n(n1)-initIndex+1;  % Convert to MATLAB index
  n(~n1) = numSamples+1;      % Fix indices that are out of range
  x = xData(n);               % Return data
end