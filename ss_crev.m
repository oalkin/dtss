function g = ss_crev(x)
  N = length(x);      % Length of x[n].
  n = [0:N-1];        % Vector of indices.
  g = ss_dper(x,-n);  % Compute periodic extension, then time reverse
end