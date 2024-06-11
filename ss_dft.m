function Xk = ss_dft(xn)
  if ~isvector(xn)
    error('Argument xn must be a vector.');
  end
  fixed = false;
  if iscolumn(xn)         % If the argument xn is in column format
    xn = xn.';            %   transpose it
    fixed = true;
  end
  N = length(xn);         % Number of samples in vector xn
  Xk = zeros(size(xn));   % Create a compatible vector Xk with all zeros
  WN = exp(-j*2*pi/N);    % Eqn. (/*\matexfileeqn{\ref{eq:FourDFT8}}*/)
  n = [0:N-1]';           % Column vector of sample indices for x[n]
  for k=0:N-1             % Compute transform samples for k=0,...,N-1
    Ak = WN.^(k*n);       % Eqn. (/*\matexfileeqn{\ref{eq:mex0517a}}*/)
    Xk(k+1) = xn*Ak;      % Eqn. (/*\matexfileeqn{\ref{eq:mex0517b}}*/)
  end
  if fixed                % If input argument was in column format
    Xk = Xk.';            %   then transpose output argument too
  end
end