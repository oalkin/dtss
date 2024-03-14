function guiSliderEnable(handle,value)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hSld = handle{1};
  hEdt = handle{3};
  set(hSld,'Enable',value);
  set(hEdt,'Enable',value);
end  