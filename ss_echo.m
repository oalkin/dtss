function [y,buffer] = ss_echo(x,r,buffer)
  y = x+r*buffer(end);           % Eqn. (2.133)
  buffer = [x;buffer(1:end-1)];  % Update buffer with new incoming sample
end