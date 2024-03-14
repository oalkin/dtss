function guiAdjustMargins(hObject)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmpPos = get(hObject,'Position');
  tmpPos = [0.13,0.2,0.81,0.68];
  set(hObject,'Position',tmpPos);