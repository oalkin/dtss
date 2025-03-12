function [y,buffer] = ss_res(x,Omg0,r,gain,buffer)
  a1 = -2*r*cos(Omg0);
  a2 = r*r;
  w = x-a1*buffer(1)-a2*buffer(2);  % Eqn. (8.195)
  y = (w-buffer(2))*gain;           % Eqn. (8.196)
  buffer = [w;buffer(1)];           % Update buffer  
end