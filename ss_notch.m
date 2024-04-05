function [y,buffer] = ss_notch(x,Omg0,r,gain,buffer)
  a1 = -2*r*cos(Omg0);
  a2 = r*r;
  b1 = -2*cos(Omg0);
  w = x-a1*buffer(1)-a2*buffer(2);      % Eqn. (/*\matexfileeqn{\ref{eq:}}*/)
  y = (w+b1*buffer(1)+buffer(2))*gain;  % Eqn. (/*\matexfileeqn{\ref{eq:}}*/)
  buffer = [w;buffer(1)];               % Update buffer  
end