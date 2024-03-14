function pts = guiInitHorzArrow2Lf(nrm,dx,dy)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmpx = [0,-nrm,-nrm+dx,-nrm+dx,-nrm];
  tmpy = [0,0,dy,-dy,0];
  pts = [tmpx;tmpy];
end  