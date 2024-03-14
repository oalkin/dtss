function guiSliderSetVal(handle,value)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hSld = handle{1};
  hEdt = handle{3};
  handle = get(hSld,'UserData');
  handle{4} = value;
  set(hSld,'Value',value);
  set(hEdt,'String',num2str(value));
  set(hSld,'UserData',handle);
  set(hEdt,'UserData',handle);
end  