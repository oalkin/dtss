function y = ss_movavg(x,N)
  persistent buffer;      % Vector to hold the 'buffer'
  if isempty(buffer)      % If the function is called for the first time
    buffer = zeros(N,1);  %   Initialize buffer
  end;
  buffer = [x;buffer(1:end-1)];  % Update buffer with new incoming sample
  y = sum(buffer)/N;      % Eqn. (2.8)
end