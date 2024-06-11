function Xk = ss_fftr2dit(xn)
  % Wrapper function for radix-2 decimation-in-time FFT
  if (min(size(xn)) > 1)    % Check to make sure xn is a vector, not a matrix
    error('Input argument ''xn'' must be a vector.');
  else
    N = max(size(xn));
    if ~ss_ispowerof2(N)    % Length of xn must be a power of 2
      error('Length of ''xn'' must be a power of 2')
    end
    xvec = xn;                % Set xvec equal to xn
    if isrow(xn)              % If xn is in row format, transpose xvec to
      xvec = xn.';            %   satisfy the requirements of ss_fftr2dit_()
    end
    Xk = ss_fftr2dit_(xvec);  % Compute the FFT
    if isrow(xn)              % If xn is in row format, transpose Xk to match it
      Xk = Xk.';              %   so that Xk is in row format too
    end
  end
end