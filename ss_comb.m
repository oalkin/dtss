function [y,buffer] = ss_comb(x,r,buffer)
  y = x+r*buffer(end);           % Eqn. (3.247)
  buffer = [y;buffer(1:end-1)];  % Update buffer with new output sample
end