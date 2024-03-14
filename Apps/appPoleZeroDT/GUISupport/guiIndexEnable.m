function guiIndexEnable(handle,value)
% This function is for internal use by the interactive demo programs that
% accompany the textbooks
%   "Continuous-Time Signals and Systems: A MATLAB-Integrated Approach"
%   and
%   "Discrete-Time Signals and Systems: A MATLAB-Integrated Approach"
%   by Oktay Alkin.
% Copyright (c) 2014-2024 by Oktay Alkin.
% All rights reserved.
%
  hBtnL = handle{1};
  hEdt = handle{2};
  hBtnR = handle{3};
  set(hBtnL,'Enable',value);
  set(hEdt,'Enable',value);
  set(hBtnR,'Enable',value);
end