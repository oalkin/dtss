function Xk = ss_dftm(xn)
  if isrow(xn)       % Check if xn is in row format
    xvec = xn.';     % xvec is always in column format
  else
    xvec = xn;
  end
  N = length(xvec);  % Find length of input signal
  a = [0:N-1];       % Create a vector of integers
  b = a'*a;          % N by N matrix of exponent kn
  Wmat = exp(-j*2*pi/N).^b;  % Eqn. (7.45)
  Xk = Wmat*xvec;
  if isrow(xn)       % If xn is in row format, transpose Xk to match it
    Xk = Xk.';
  end
end