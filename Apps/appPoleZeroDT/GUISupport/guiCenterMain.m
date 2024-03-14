function guiCenterMain(hObject)
% This function is for internal use by the interactive demo programs
% that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  tmpScr = get(0,'ScreenSize');
  tmpVal = get(hObject,'Position');
  tmpVal(1) = (tmpScr(3)-tmpVal(3))/2;
  tmpVal(2) = (tmpScr(4)-tmpVal(4))/2;
  set(hObject,'Position',tmpVal);