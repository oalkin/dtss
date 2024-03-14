function pts = guiInitVertArrow2(nrm,dx,dy)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmpx = [0,-dx,dx,0,0,-dx,dx,0];
  tmpy = [0,dy,dy,0,nrm,nrm-dy,nrm-dy,nrm];
  pts = [tmpx;tmpy];
end  