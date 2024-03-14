function pts = guiDrawHorzArrow(x1,x2,y,hAxes)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  [dx,dy] = guiHorzArrowTip(hAxes);
  pts = guiInitHorzArrow2(abs(x2-x1),dx,dy);
  pts(1,:) = pts(1,:)+x1;
  pts(2,:) = pts(2,:)+y;
end  