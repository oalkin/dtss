function Xk = ss_goertzel2(x,k)
  N = length(x);              % Number of samples in vector x[n]
  gain = 2*cos(2*pi*k/N);
  q = 0;                      % Node variable q[n] -- see Fig. 7.24
  v = 0;                      % Node variable v[n] -- see Fig. 7.24
  x = [x,0];                  % Zero-pad x[n] with one more sample
  for n=1:N+1                 % Loop through the filter
    p = x(n)+gain*q-v;        % Eqn. (7.90)
    v = q;                    % Update node variable q[n]
    q = p;                    % Update node variable v[n]
  end
  Xk = p-exp(-j*2*pi*k/N)*v;  % Eqn. (7.91)
end