function guiChangeXLabel(hObject,str)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  str = sprintf('\\textsf{%s}',str);
  hLabel = get(hObject,'XLabel');
  set(hLabel,'String',str);