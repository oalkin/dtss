% Script: mexdt_1_6a.m
idx=[-10:10];   % Index range for the result
g = [];         % Start with empty vector
for n=idx                       % Loop over indices
  value = mysig(n)+mysig(-n);   % Compute each sample
  g = [g,value];                % Append to the vector
end
g                               % Display the vector g
stem(idx,g);                    % Graph the signal g

function x = mysig(n)
  xData = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
  initIndex = -7;   % Initial index
  finalIndex = 2;   % Final index
  if (n>=initIndex & n<=finalIndex)  % Check if n is in range
    x = xData(n-initIndex+1);        % If yes, adjust index for MATLAB
  else
    x = 0;                           % Otherwise return 0
  end
end