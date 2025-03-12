function [y,buffer] = ss_resf(x,Omg0,r,gain,buffer)
  y = zeros(size(x));     % Placeholder for output frame     
  frameSize = size(x,1);  % Number of samples in each frame
  a1 = -2*r*cos(Omg0);    % Compute coefficients outside loop
  a2 = r*r;
  for i=1:frameSize
    % Scalar w below is w[n] in Fig. /*\matexfileeqn{\ref{fig:resbp6}}*/ 
    w = x(i,:)-a1*buffer(1,:)-a2*buffer(2,:);  % Eqn. (8.195)
    y(i,:) = (w-buffer(2,:))*gain;             % Eqn. (8.196)
    buffer = [w;buffer(1,:)];                  % Update buffer  
  end
end