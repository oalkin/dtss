function [y,buffer] = ss_movavgb(x,N,buffer)
  buffer = [x;buffer(1:end-1)];   % Update buffer with new incoming sample
  y = sum(buffer)/N;              % Eqn. (2.8)
end