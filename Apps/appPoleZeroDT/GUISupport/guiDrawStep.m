function pts = guiDrawStep(A,t0,t1,t2)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  x = [t1,t0,t0,t2];
  y = [0,0,A,A];
  pts = [x;y];
end