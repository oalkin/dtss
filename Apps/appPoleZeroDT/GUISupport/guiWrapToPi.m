function newPhs = guiWrapToPi(phs)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmp1 = phs/pi+1;
  tmp2 = mod(tmp1,2)-1;
  newPhs = tmp2*pi;
end