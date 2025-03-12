function c = ss_dtfs2(x,idx)
  c = zeros(size(idx));   % Create all-zero vector
  N = length(x);          % Period of the signal x[n]
  WN = exp(-j*2*pi/N);    % Eqn. (3.241)
  n = [0:N-1]';           % Column vector of sample indices for x[n]
  for kk = 1:length(idx)  % Loop over indices in vector idx
    k = idx(kk);
    Ak = WN.^(k*n);       % Eqn. (3.243)
    c(kk) = x*Ak/N;       % Eqn. (3.244)
  end  
end