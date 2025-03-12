function Xk = ss_fftr2dit_(xn)
  N = length(xn);
  if (N==1)
    % If the length of xn is 1, return Xk = xn (1-point DFT)
    Xk = xn;
  else
    % Otherwise split x[n] into half-length signals g[n] and h[n], 
    % and compute their transforms
    gn = xn(1:2:N-1);       % Eqn. (7.125)
    hn = xn(2:2:N);         % Eqn. (7.126)
    Gk = ss_fftr2dit_(gn);  % Recursively call the function ss_fftr2dit_()
    Hk = ss_fftr2dit_(hn);  %   to compute half-length transforms
    % Prepare the vector S = W.^k needed for merging Gk and Hk
    k = [0:N-1]';
    S = exp(-j*2*pi/N).^k;
    % Combine the two half-length transforms into a full-length
    % transform
    Xk = [Gk;Gk]+S.*[Hk;Hk];  % Eqn. (7.127)
  end;
end