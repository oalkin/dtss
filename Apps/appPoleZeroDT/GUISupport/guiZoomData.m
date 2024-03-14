function guiZoomData(hAxes,zIdxx,zIdxy,zxa,zxb,zya,zyb)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  uData = get(hAxes,'UserData');
  uData{5} = zIdxx;
  uData{6} = zIdxy;
  uData{7} = zxa;
  uData{8} = zxb;
  uData{9} = zya;
  uData{10} = zyb;
  set(hAxes,'UserData',uData);
end