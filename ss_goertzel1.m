function Xk = ss_goertzel1(x,k)
  N = length(x);            % Number of samples in vector x[n]
  gain = exp(j*2*pi*k/N);
  yknm1 = 0;                % Buffer for yk[n-1]
  x = [x,0];
  for n=1:N+1               % Loop through the filter
    ykn = x(n)+gain*yknm1;  % Eqn. (7.87)
    yknm1 = ykn;            % Update yk[n-1]
  end
  Xk = ykn;
end