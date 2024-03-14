function pts = guiDrawArrow(x1,y1,nrm,phi,dx,dy)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  pts = guiInitArrow(nrm,dx,dy);
  rot = [cos(phi),-sin(phi);sin(phi),cos(phi)];
  pts = rot*pts;
  pts(1,:) = pts(1,:)+x1;
  pts(2,:) = pts(2,:)+y1;
end  