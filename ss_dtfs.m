function c = ss_dtfs(x,idx)
  c = zeros(size(idx));   % Create all-zero vector
  N = length(x);          % Period of the signal x[n]
  for kk = 1:length(idx)  % Loop over indices in vector idx
    k = idx(kk);
    tmp = 0;              % Reset running sum
    for nn = 1:length(x)
      n = nn-1;           % MATLAB array indices start with 1
      tmp = tmp+x(nn)*exp(-j*2*pi/N*k*n);  % Eqn. (/*\mexfiledteqn{\ref{eq:fdpDTFS17}}*/)
    end
    c(kk) = tmp/N;
  end  
end