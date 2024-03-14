function pts = guiBlock(ctr,width,height)
% This function is for internal use by the interactive demo 
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  xmin = ctr(1)-0.5*width;
  xmax = ctr(1)+0.5*width;
  ymin = ctr(2)-0.5*height;
  ymax = ctr(2)+0.5*height;
  pts = [xmin,xmin,xmax,xmax,xmin;ymin,ymax,ymax,ymin,ymin];