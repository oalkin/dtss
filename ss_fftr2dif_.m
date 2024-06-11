function Xk = ss_fftr2dif_(xn)
  N = length(xn);
  if (N==1)
    % If the length of xn is 1, return Xk = xn
    Xk = xn;
  else
    % Otherwise split x[n] into half-length signals g[n] and h[n], 
    % and compute their transforms
    gn = xn(1:N/2)+xn(N/2+1:N);       % Eqn. (/*\matexfileeqn{\ref{eq:FourFFTdif9}}*/)
    idx = [0:N/2-1]';
    S = exp(-j*2*pi/N).^idx;          % Compute vector W.^n
    hn = (xn(1:N/2)-xn(N/2+1:N)).*S;  % Eqn. (/*\matexfileeqn{\ref{eq:FourFFTdif10}}*/)
    Gk = ss_fftr2dif_(gn);  % Recursively call the function ss_fftr2dif_()
    Hk = ss_fftr2dif_(hn);  %   to compute half-length transforms
    % Combine the two half-length transforms into a full-length
    % transform as detailed in Eqn. (/*\matexfileeqn{\ref{eq:FourFFTdif11}}*/)
    Xk = [Gk.';Hk.'];
    Xk = Xk(:);      
  end
end