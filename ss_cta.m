function XDTFT = ss_cta(xn,Omg0,Delta,M)
  N = length(xn);       % Length of signal x[n]
  xvec = xn;            % Make a copy of xn in xvec
  if isrow(xn)          % If xn is in row format, transpose xvec to
    xvec = xn.';        %   column format
  end  
  n = [0:N-1]';         % Vector of sample indices
  V = exp(-j*Delta);    
  gn = xvec.*exp(-j*Omg0*n).*V.^(n.*n/2);  % Eqn. (/*\matexfileeqn{\ref{eq:Chirp9}}*/)
  nn = [-N+1:M-1]';     % Index range for h[n] -- See section /*\matexfileeqn{\ref{ss:ChirpTrans}}*/
  hn = V.^(-nn.*nn/2);  % Eqn. (/*\matexfileeqn{\ref{eq:Chirp14}}*/)
  tmp = conv(gn,hn);    % Convolve g[n] and h[n]
  tmp = tmp(N:N+M-1);   % Discard first and last (N-1) samples
  k = [0:M-1]';
  XDTFT = tmp.*V.^(k.*k/2);  % Eqn. (/*\matexfileeqn{\ref{eq:Chirp11}}*/)
  if isrow(xn)          % If xn is in row format, transpose XDTFT to match
    XDTFT = XDTFT.';    %   it so that XDTFT is in row format too
end