function pts = guiCircle(ctr,radius,n)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  theta = linspace(0,2*pi,n);
  r = ones(1,n)*radius;
  [x,y] = pol2cart(theta,r);
  x = x+ctr(1);
  y = y+ctr(2);
  pts = [x;y];
end  