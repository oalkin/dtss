function xtilde = ss_dper(x,n)
  Nper = length(x);    % Period of the signal
  nmod = mod(n,Nper);  % Modulo indexing
  nn = nmod+1;         % MATLAB indices start with 1
  xtilde = x(nn);      % Return periodic signal
end

