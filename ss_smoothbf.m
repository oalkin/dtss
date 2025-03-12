function [y,ynm1] = ss_smoothbf(x,alpha,ynm1)
  y = zeros(size(x));
  frameSize = size(x,1);    % Get the frame size
  for i = 1:frameSize       % Repeat for the specified range
    y(i,:) = (1-alpha)*ynm1+alpha*x(i,:);  %   Eqn. (2.9)
    ynm1 = y(i,:);          %   Bookkeeping to prepare for next call
  end
end