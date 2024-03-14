function guiChangePlotTitle(hObject,str)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  str = sprintf('\\textsf{%s}',str);
  hTitle = get(hObject,'Title');
  set(hTitle,'String',str);