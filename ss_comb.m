function [y,buffer] = ss_comb(x,r,buffer)
  y = x+r*buffer(end);           % Eqn. (/*\matexfileeqn{\ref{eq:mex0524d}}*/)
  buffer = [y;buffer(1:end-1)];  % Update buffer with new output sample
end