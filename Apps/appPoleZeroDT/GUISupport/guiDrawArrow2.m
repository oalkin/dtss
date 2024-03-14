function pts = guiDrawArrow2(x1,y1,x2,y2,dx,dy)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  vec = (x2-x1)+j*(y2-y1);
  nrm = abs(vec);
  phi = angle(vec);
  pts = guiInitArrow(nrm,dx,dy);
  alpha = nrm-dx;
  pts(1,:) = pts(1,:)-alpha;
  rot = [cos(phi),-sin(phi);sin(phi),cos(phi)];
  pts = rot*pts;
  pts(1,:) = pts(1,:)+alpha*cos(phi)+x1;
  pts(2,:) = pts(2,:)+alpha*sin(phi)+y1;
%   pts(1,:) = pts(1,:)+x1;
%   pts(2,:) = pts(2,:)+y1;
end  