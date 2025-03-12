function g = ss_cshift(x,m)
  N = length(x);       % Length of x[n]
  n = [0:N-1];         % Vector of indices
  g = ss_dper(x,n-m);  % Compute periodic extension, then shift
end