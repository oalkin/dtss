function [y,buffer] = ss_movavgbf(x,N,buffer)
  y = zeros(size(x));
  frameSize = size(x,1);               % Get the frame size
  for i = 1:frameSize                  % Repeat for the specified range
    buffer = [x(i,:);buffer(1:N-1,:)]; %   Update buffer
    y(i,:) = sum(buffer)/N;            %   Eqn. (2.8)
  end
end