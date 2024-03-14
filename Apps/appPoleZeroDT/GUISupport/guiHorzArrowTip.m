function [dx,dy] = guiHorzArrowTip(hAxes)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
% 
  axes(hAxes);
  guiSetAxes(hAxes);
  T1 = text(1000,1000,'A');
  pos = get(T1,'Extent');
  set(T1,'Visible','off');
  dx = pos(3)/2;
  dy = pos(4)/4;
end

