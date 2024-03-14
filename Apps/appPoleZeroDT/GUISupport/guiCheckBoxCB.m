function tmp = guiCheckBoxCB(hObject,eventdata)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  if (get(hObject,'Value') == get(hObject,'Max'))
    tmp = 1;
  else
    tmp = 0;
  end;  