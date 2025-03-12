function XDTFT = ss_dtft(xn,Omg)
  N = length(xn);              % Length of the signal x[n]
  xvec = xn;                   % Set xvec to xn
  if isrow(xn)                 % If xn is in row format, transpose xvec to
    xvec = xn.';               %   column format
  end
  numFreq = length(Omg);       % Number of frequencies in vector Omg
  n = [0:N-1];                 % Vector of sample indices
  W = [];                      % Initialize coefficient matrix
  for k = 1:numFreq
    W = [W;exp(-j*Omg(k)*n)];  % Fill coefficient matrix
  end
  XDTFT = W*xvec;      % Compute transform at specified frequencies
  if isrow(xn)         % If xn is in row format, transpose XDTFT to match
    XDTFT = XDTFT.';   %   it so that XDTFT is in row format too
  end
end