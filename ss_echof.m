function [y,buffer] = ss_echof(x,r,buffer)
  y = zeros(size(x));                     % Placeholder for output frame     
  frameSize = size(x,1);     
  for i=1:frameSize
    y(i,:) = x(i,:)+r*buffer(end,:);      % Eqn. (2.133)
    buffer = [x(i,:);buffer(1:end-1,:)];  % Update buffer
  end
end