function c = ss_dtfs2(x,idx)
  c = zeros(size(idx));   % Create all-zero vector
  N = length(x);          % Period of the signal x[n]
  WN = exp(-j*2*pi/N);    % Eqn. (/*\mexfiledteqn{\ref{eq:mex0525a}}*/)
  n = [0:N-1]';           % Column vector of sample indices for x[n]
  for kk = 1:length(idx)  % Loop over indices in vector idx
    k = idx(kk);
    Ak = WN.^(k*n);       % Eqn. (/*\mexfiledteqn{\ref{eq:mex0525c}}*/)
    c(kk) = x*Ak/N;       % Eqn. (/*\mexfiledteqn{\ref{eq:mex0525d}}*/)
  end  
end