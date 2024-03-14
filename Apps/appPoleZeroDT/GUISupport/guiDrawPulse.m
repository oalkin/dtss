function pts = guiDrawPulse(A,width,ctr,t1,t2)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmp1 = ctr-0.5*width;
  tmp2 = ctr+0.5*width;
  x = [t1,tmp1,tmp1,tmp2,tmp2,t2];
  y = [0,0,A,A,0,0];
  pts = [x;y];