function x = ss_invdtfs2(c,idx)
  x = zeros(size(idx));   % Create all-zero vector
  N = length(c);          % Period of the coefficient set
  WN = exp(-j*2*pi/N);    % Eqn. (3.241)
  k = [0:N-1]';           % Column vector of sample indices for ck
  for nn = 1:length(idx)  % Loop over indices in vector idx
    n = idx(nn);
    Ak = WN.^(-k*n);
    x(nn) = c*Ak;
  end 
end