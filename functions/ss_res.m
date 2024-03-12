function [y,buffer] = ss_res(x,Omg0,r,gain,buffer)
  a1 = -2*r*cos(Omg0);
  a2 = r*r;
  w = x-a1*buffer(1)-a2*buffer(2);  % Eqn. (/*\matexfileeqn{\ref{eq:mex1014a}}*/)
  y = (w-buffer(2))*gain;           % Eqn. (/*\matexfileeqn{\ref{eq:mex1014b}}*/)
  buffer = [w;buffer(1)];           % Update buffer  
end