function pts = guiDrawVertArrow(x,y1,y2,hAxes)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  [dx,dy] = guiVertArrowTip(hAxes);
  pts = guiInitVertArrow2(abs(y2-y1),dx,dy);
  pts(1,:) = pts(1,:)+x;
  pts(2,:) = pts(2,:)+y1;
end  