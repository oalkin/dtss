function [y,buffer] = ss_combf(x,r,buffer)
  y = zeros(size(x));                     % Placeholder for output frame     
  frameSize = size(x,1);     
  for i=1:frameSize
    y(i,:) = x(i,:)+r*buffer(end,:);      % Eqn. (/*\matexfileeqn{\ref{eq:mex0524d}}*/)
    buffer = [y(i,:);buffer(1:end-1,:)];  % Update buffer
  end
end