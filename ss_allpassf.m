function [y,buffer] = ss_allpassf(x,r,buffer)
  y = zeros(size(x));                     % Placeholder for output frame     
  frameSize = size(x,1);     
  for i=1:frameSize
    w(i,:) = x(i,:)+r*buffer(end,:);      % Eqn. (/*\mexfiledteqn{\ref{eq:mex0814a}}*/)
    y(i,:) = -r*w(i,:)+buffer(end,:);     % Eqn. (/*\mexfiledteqn{\ref{eq:mex0814b}}*/)
    buffer = [w(i,:);buffer(1:end-1,:)];  % Update buffer
  end
end