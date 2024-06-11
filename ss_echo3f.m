function [y,buffer] = ss_echo3f(x,L,r,buffer)
  y = zeros(size(x));  % Placeholder for output frame     
  frameSize = size(x,1);
  % Coefficients for the difference equation:
  a = r;  
  b = a*r;  % Compute r^2 before the loop
  c = b*r;  % Compute r^3 before the loop
  for i=1:frameSize
    % Eqn. (/*\matexfileeqn{\ref{eq:mex0255b}}*/):
    y(i,:) = x(i,:)+a*buffer(L,:)+b*buffer(2*L,:)+c*buffer(3*L,:);      
    buffer = [x(i,:);buffer(1:end-1,:)];  % Update buffer
  end
end