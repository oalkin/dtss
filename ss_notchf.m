function [y,buffer] = ss_notchf(x,Omg0,r,gain,buffer)
  y = zeros(size(x));     % Placeholder for output frame     
  frameSize = size(x,1);  % Number of samples in each frame
  a1 = -2*r*cos(Omg0);    % Compute coefficients outside loop
  a2 = r*r;
  b1 = -2*cos(Omg0);
  for i=1:frameSize
    w = x(i,:)-a1*buffer(1,:)-a2*buffer(2,:);      % Eqn. (8.197)
    y(i,:) = (w+b1*buffer(1,:)+buffer(2,:))*gain;  % Eqn. (8.198)
    buffer = [w;buffer(1,:)];                      % Update buffer  
  end
end